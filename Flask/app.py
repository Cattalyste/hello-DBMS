import mysql.connector
from flask import Flask, render_template,request
from math import ceil


median_CO2=[0,820,490,740,24,41,12]
titre1=["Country","Coal","Gas","Oil","Hydro","Renewable","Nuclear","gCO2/kWh"]
titre2=["Source de production","% D'utilisation","Médiane de gCO2/kWh","Contribution en émission gCO2/kWh"]
titre=['','Charbon','Gaz Naturel','Petrole','Hydro','Renouvelable','Nucléaire']


def get_db_connection():
    conn = mysql.connector.connect(user='root', password='test',
                              host='127.0.0.1',
                              database='carbonfootprint')
    return conn

def query_all():
    conn = get_db_connection()
    curA = conn.cursor(buffered=True)
    query1 = ("SELECT * FROM country")
    curA.execute(query1)
    joblist=curA.fetchall()
    conn.close()    
    return joblist

def calcul_co2_pondere(joblist):
    temp=0
    for i in range(len(joblist)):
        for j in range(1,7):
            temp+=median_CO2[j]*joblist[i][j]
        temp=round(0.01*temp,2)
        joblist[i]=joblist[i]+(temp,)
        temp=0
    return joblist

def query_specific_country(country):
    conn = get_db_connection()
    curA = conn.cursor(buffered=True)
    query = ("SELECT * FROM Country WHERE country = '{}'".format(country))
    curA.execute(query)
    joblist=curA.fetchall()
    conn.close()    
    return joblist

def construction_tableau_specif(country_selected,country_consumption):
    data=query_specific_country(country_selected)
    
    temp=0
    tableau=[]
    for i in range(1,7):
        tableau.append([titre[i],
                       data[0][i],
                       median_CO2[i],
                       str(data[0][i])+'% x '+ str(median_CO2[i]) + ' = ' + str(round(0.01*data[0][i]*median_CO2[i],2))])
        temp+=median_CO2[i]*data[0][i]
    temp=round(0.01*temp,2)
    tableau.append(["Contribution en émission gCO2/kWh pondéré pour le pays : "+ country_selected,"","",str(temp)])
    tableau.append(["Production annuel en kg de CO2 pour "+str(country_consumption)+" kWh de produit","","",str(round(0.001*temp*int(country_consumption),2))])
    tableau.append(["Nombre d'arbre necessaire : ","","",str(ceil(0.001*temp*int(country_consumption)/25))])
    return tableau


app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    
    if request.method == 'POST':
        country_selected = request.form['Country_selected']
        if type(request.form['conso']) == int:
            country_consumption = request.form['conso']
        else :
            country_consumption = 0
        
        joblist=query_all()
        tableau=construction_tableau_specif(country_selected,country_consumption)

        return render_template('index.html', query=tableau, query1=joblist,titre=titre2)
    
    
    tableau=query_all()
    joblist=calcul_co2_pondere(tableau)
    print(type(tableau))    
    return render_template('index.html',query=tableau[:10], query1=joblist,titre=titre1)



