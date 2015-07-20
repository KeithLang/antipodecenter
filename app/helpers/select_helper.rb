module SelectHelper
  def party_select
    [['Democrats', 'democrats'], ['Republicans', 'republican']]
  end

  def category_select
    Category.all.map do |c|
      [c.name, c.id]
    end  
  end

end
