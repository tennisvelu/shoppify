class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_sub_category
    @category_subcategory = CategorySubcategory.new
    @categories = Category.all
  end  

  def assign_category_to_sub_category
    @category_subcategory = CategorySubcategory.new(category_subcategory_params)
    if @category_subcategory.save
      flash[:notice] = 'Category successfully assigned to Subcategory.' 
      redirect_to assign_sub_category_categories_url
    else
      flash[:notice] = "Can't able to Assign Subcategory"
      redirect_to assign_sub_category_categories_path
    end
  end 

  def sub_categories
    category = Category.find(params[:category_id])
    @sub_categories = Category.sub_category(category)
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :status)
    end

    def category_subcategory_params
      params.require(:category_subcategory).permit(:category_id, :sub_category_id)
    end
end
