class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
     @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)
    @contact = Contact.new(params[:contact])
   
    
      if @contact.save
        ContactMailer.contact_notification(@contact).deliver
        redirect_to contacted_path
      else
        render "new"
      end
    
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  def thanks 
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)
  end
    
  
end
