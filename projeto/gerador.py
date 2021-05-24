import random
import string

f = open('gerador.txt', 'w')

nomes = ['Alexandre'	,'Eduardo',	'Henrique',	'Murilo',	'Theo',
'Andre',	'Enrico',	'Henry',	'Nathan',	'Thiago',
'Antonio',	'Enzo',	'Ian',	'Otávio',	'Thomas',
'Augusto',	'Erick',	'Isaac'	,'Pietro',	'Vicente',
'Breno'	,'Felipe',	'Joao',	'Rafael',	'Vinicius',
'Bruno',	'Fernando',	'Kaique',	'Raul',	'Vitor',
'Caio',	'Francisco',	'Leonardo',	'Rian'	,'Yago',
'Caua',	'Frederico'	,'Luan'	,'Ricardo'	,'Ygor',
'Daniel',	'Guilherme',	'Lucas',	'Rodrigo'	,'Yuri',
'Danilo',	'Gustavo'	,'Mathias',	'Samuel'	]
sex = ['F', 'M']
endereco = ['joão', 'pedro', 'luz', 'luzia', 'pualo', 'centro', 'amanhacer', 'paulo', 'frederico', 'brasil', 'campina', 'queimadas']
cores = ['azul', 'preto', 'marrom', 'branco', 'cinza', 'vermelhor', 'prata', 'amarelo', 'verde']
alfabeto = list(string.ascii_lowercase)
chassis = []
placa = []
modelos = {
    100000: 11,
100001: 11,
100002: 11,
100003: 11,
100004: 11,
100005: 11,
100006: 11,
100007: 11,
100008: 10,
100009: 10,
100010: 15,
100011: 14,
100012: 14,
100013: 16
}

brs = ['120','380','240','112','448','346', '199']
velocidae_max = ['100', '80', '110'] 

def generateColor():
    return random.choice(cores)

def generateChassi():
    chassi = ""
    for _ in range(17):
        if(random.randint(0,1)):
            chassi+=random.choice(alfabeto)
        else:
            chassi+=str(random.randint(0,10))
    return chassi

def generatePlaca():
    letras = ""
    numeros = ""
    for _ in range(3):
        letras+=random.choice(alfabeto)
    for _ in range(4):
        numeros+=str(random.randint(0,9))

    plaquinha = letras+numeros
    if(plaquinha in placa): 
        return generatePlaca()
    placa.append(plaquinha)
    return plaquinha

def generateAdress():
    return 'Rua ' + random.choice(endereco).title() + " "+ random.choice(endereco).title() + ", n {}".format(random.randint(0,1000)) 

def generateSex():
    return sex[random.randint(0,1)]

def generateName():
    return random.choice(nomes) + " " +  random.choice(nomes)

def generateGreaterCpf():
    return random.randint(10000000000,99999999999)

def generateGreaterPhone():
    number = random.randint(100000000,999999999)
    return '5583'+str(number)

def generateDate(padrao=1950, endDate=2002):
    return str(random.randint(padrao,endDate)) +  "-" + str(random.randint(1,12)) + '-' + str(random.randint(1,28))

def generateModelo():
    return random.choice(list(modelos.keys()))

def generateAno():
    return random.randint(1990, 2021)

def generateMatricula():
    return random.randint(100000, 999999)

def generateEmail(name):
    nome = name.split(" ")[0].lower()
    sobrenome = name.split(" ")[1].lower()
    return nome+sobrenome+str(random.randint(0,1000))+random.choice(alfabeto)+"@email.com"

def generateRodovia():
    return "BR " + random.choice(brs)

def generateKM():
    return random.randint(5,200)

def generateVelocidadeMax():
    return random.choice(velocidae_max)

def generateHorario():
    return '{}:{}:{}'.format(random.randint(8,18), random.randint(0,59), random.randint(0,59))

def generateInfratipo(num=2):
    number = random.randint(1,8)
    if(number == num):
        return generateInfratipo()
    return number

for x in range (1,50):

    cpfAgente = generateGreaterCpf()
    nomeAgente = generateName()
    velocMax = generateVelocidadeMax()
    matriAgente = generateMatricula()

    f.write('INSERT INTO agente_transito (cpf, nome, matricula, sexo, dataContratacao)\n')
    f.write("VALUES({}, '{}', {}, '{}', '{}');\n".format(cpfAgente,nomeAgente ,matriAgente , generateSex(), generateDate(padrao=1990)))
    f.write('INSERT INTO telefone_agente (cpf,telefone)\n')
    f.write("VALUES({}, '{}');\n".format(cpfAgente, generateGreaterPhone()))
    f.write('INSERT INTO email (cpf,email)\n')
    f.write("VALUES({}, '{}');\n".format(cpfAgente, generateEmail(name=nomeAgente)))
    f.write('INSERT INTO local_infracao (rodovia, altura, velocidadeMax)\n')
    f.write("VALUES('{}', {}, {});\n".format(generateRodovia(), generateKM(), velocMax))

    for y in range(1,20):
        cpfProprietario = generateGreaterCpf()
        modelo = generateModelo()
        placaProprietario = generatePlaca()

        f.write('INSERT INTO proprietario (cpf, nome, sexo, endereco, dataNasc)\n')
        f.write("VALUES({}, '{}', '{}', '{}', '{}');\n".format(cpfProprietario, generateName(), generateSex(), generateAdress(), generateDate()))
        f.write('INSERT INTO telefone_proprietario (cpf,telefone)\n')
        f.write("VALUES({}, '{}');\n".format(cpfProprietario, generateGreaterPhone()))
        f.write("INSERT INTO veiculo (placa, chassi, cor, modelo, categoria, ano, propCpf)\n")
        f.write("VALUES('{}', '{}', '{}', {}, {}, '{}', {});\n".format(placaProprietario, generateChassi(), generateColor(), modelo, modelos[modelo], generateAno(), cpfProprietario))
        if(random.randint(0,1)):
            if(random.randint(0,5) == 3):
                velocidade = int(velocMax) + 10
                infratipo = 2
            else:
                velocidade = int(velocMax) -10
                infratipo = generateInfratipo()
            f.write("INSERT INTO infracao ( placaInfrator, dataOcorrencia, tempoOcorrencia, infraTipo, velocidade, codigoLocal, matriAgente)\n")
            f.write("VALUES('{}', '{}','{}', {}, {}, {}, {});\n".format(placaProprietario, generateDate(padrao=2019, endDate=2021), generateHorario(), infratipo,velocidade, x,matriAgente))
        f.write("\n")

f.close()