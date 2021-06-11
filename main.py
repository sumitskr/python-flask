from flask import Flask ,render_template ,request,session,redirect,flash
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from werkzeug.utils import secure_filename
import os
import math
from flask_mail import Mail
with open('config.json', 'r') as c :
    params =json.load(c)["params"]

local_server=True

app=Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['uploader location']
'''mail setup starts::::'''
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com' ,
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail_username'],
    MAIL_PASSWORD = params['gmail_password']
)

mail=Mail(app)

'''json parameter setup'''
if(local_server):


#sqlalchemy starts here
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']

else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


    #class for defining the databse of the table

class Contacts(db.Model):       #also name of database

    '''sno,name,email,phone_num,msgs,date'''
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    email = db.Column(db.String(120), unique=False, nullable=False)
    phone_num = db.Column(db.String(20), unique=True, nullable=False)
    msgs = db.Column(db.String(120), unique=False, nullable=False)
    date = db.Column(db.String(12), unique=True, nullable=True)

class Posts(db.Model):  #also name of databse

    '''sno,title,slug,content,date'''
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), unique=True, nullable=False)
    subtitle = db.Column(db.String(50), unique=False, nullable=False)
    slug = db.Column(db.String(25), unique=True, nullable=False)
    content = db.Column(db.String(120), unique=False, nullable=False)
    date = db.Column(db.String(12), unique=True, nullable=True)
    img_url =db.Column(db.String(30),unique=True,nullable=True)
@app.route("/")
def home():
    posts=Posts.query.filter_by().all()
    #[0:params['post_number']]
    last=int(math.ceil(len(posts) / int(params['post_number'])))
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page = int(page)
    posts=posts[(page-1)*int(params['post_number']) : (page-1)*int(params['post_number']) + int(params['post_number']) ]

    if(page==1):
        prev="#"
        next="/?page=" + str(page+1)
    elif(page==last):
        prev = "/?page=" + str(page-1)
        next = "#"
    else:
        prev = "/?page=" + str(page-1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html',params=params,posts=posts,prev=prev,next=next)





@app.route("/about")
def about():
    return render_template('about.html',params=params)




@app.route("/contact",methods=["GET","POST"])
def contact():
    if(request.method=='POST'):
        '''add entry to the data base'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')


        '''Set var to the db - input : sno,name,email,phone_num,msgs,date'''
        entry = Contacts(name=name , phone_num=phone ,email=email,date=datetime.now(), msgs=message )
        db.session.add(entry)
        db.session.commit()
        '''send msgs through mail'''
        mail.send_message('New message from ' + name,
                          sender='email',
                          recipients=[params['gmail_username']],
                          body = message + "\n" + phone )

    return  render_template('contact.html',params=params)







@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post=Posts.query.filter_by(slug=post_slug).first()

    return render_template('post.html',params=params,post=post)


@app.route("/dashboard",methods=['GET','POST'])
def dashboard():

    if( 'user' in session and session['user']==params['admin_usr'] ):
        posts=Posts.query.filter_by().all()
        return render_template('dashboard.html',params=params,posts=posts)

    if request.method =='POST':
        username=request.form.get('username')
        password=request.form.get('password')
        posts=Posts.query.filter_by().all()
        if(username== params['admin_usr'] and password==params['admin_pass']):
            session['user']=username
            return render_template('dashboard.html',params=params,posts=posts)




    else:
        return render_template('login.html', params=params)



    return render_template('login.html',params=params)

@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):
    if ('user' in session and session['user'] == params['admin_usr']):
        if (request.method == 'POST'):
            box_title = request.form.get('title')
            subtitle=request.form.get('subtitle')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_url =request.form.get('img_url')
            date=datetime.now()
            if sno =='0':
                post = Posts(title=box_title,subtitle=subtitle,content=content,slug=slug,img_url=img_url,date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title=box_title
                post.subtitle=subtitle
                post.slug=slug
                post.img_url=img_url
                post.content=content
                post.date=date

                db.session.commit()
                return redirect('/edit/'+sno)
        post=Posts.query.filter_by(sno=sno).first()
        return render_template('add_post.html',params=params,post=post)
        



@app.route("/uploader",methods=['GET','POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_usr']):
        if(request.method=='POST'):
            f=request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            flash('Uploaded Sucessfully')
            return redirect('/dashboard')



@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:sno>",methods=['GET','POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['admin_usr']):
        post =Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()

        return redirect('/dashboard')
app.run(debug=True)















