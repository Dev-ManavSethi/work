Department.select(:name).where('id>?', 8).order(name: :asc).group(:name, :id).having("id < ?", 10).only(:select)
Department.select(:name).where('id>?', 8).order(name: :asc).group(:name, :id).having("id < ?", 10).only(:select)
Department.select(:name).where('id>?', 8).order(name: :asc).groonly(:select)
Department.select(:name).where('id>?', 8).order(name: :asc).group(:name, :id).having("id < ?", 10)
Department.select(:name).where('id>?', 4).order(name: :asc).group(:name, :id).having("id < ?", 10)
Department.none
d=Department.readonly.all
d.save
d[0].name="aaaa "
d[0].save
q=Department.joins(:teachers)
q=Department.joins(:teacher)
q=Department.joins(:hodr)

q=Department.joins(:hod)
q=Department.joins("INNER JOIN sections ON departments.id=sections.department_id")
q=Department.joins("INNER JOIN sections ON departments.id=sections.department_id").first
q=Department.joins("INNER JOIN sections ON departments.id=sections.department_id").last
Department.select(:name).order(name: :asc).display
Department.select(:name).order(name: :asc).distinct
Department.select(:name).order(name: :asc).distinct.limit(5)
Department.select(:name).order(name: :asc).distinct.limit(5).offset(80)
Department.select(:name).order(name: :asc).group(:name).count
Department.select(:name).order(name: :asc).group(:name).having("id < ?", 10).count
Department.select(:name).order(name: :asc).group(:name, :id).having("id < ?", 10).count
Department.select(:name).order(name: :asc).group(:name, :id).having("id < ?", 10).count.unscope(:order)
Department.select(:name).order(name: :asc).group(:name, :id).having("id < ?", 10).unscope(:order)
Department.select(:name).order(name: :asc).group(:name, :id).having("id < ?", 10).unscope(:order).count
Department.all
Department.select(:name).order(name: :asc).group(:name, :id).having("id < ?", 10).only(:select).count
Department.select(:name).order(name: :asc).group(:name, :id).having("id < ?", 10).only(:select).reselect(:id)count

Department.select(:name).order(name: :asc).group(:name, :id).having("id < ?", 10).only(:select).reselect(:id).count
Department.select(:name).order(name: :asc).group(:name, :id).having("id < ?", 10).only(:select).reselect(:id)
Department.select(:name).order(name: :asc).group(:name, :id).having("id < ?", 10).only(:select)
Department.select(:name).order(name: :asc).group(:name, :id).having("id < ?", 10).only(:select).reverse_order
Section.first.subject
Section.first.subjects
Section.first.department.subjects
Section.first.department
Section.last.department
Department.first.subjects
Department.first.students
Department.where("id>?", 25)
Department.where("id" => 25)
Department.where("id" => (25..45))
Department.where.not("id" => (25..45))
Department.where("id" => (25..45)).or(Department.where("id"=>(50..99)))
puts Readline::HISTORY.to_a

Department.order(name: :asc)
Department.select(:name).order(name: :asc)
Department.select(:name).order(name: :asc).deselect(:id)
Department.select(:name).order(name: :asc)
Section.first.subject
Section.first.subjects
Section.first.department.subjects
Section.first.department
Section.last.department
Department.first.subjects
Department.first.students
Department.where("id>?", 25)
Department.where("id" => 25)
Department.where("id" => (25..45))
Department.where.not("id" => (25..45))
Department.where("id" => (25..45)).or(Department.where("id"=>(50..99)))
puts Readline::HISTORY.to_a

Department.order(name: :asc)
Department.select(:name).order(name: :asc)
Department.select(:name).order(name: :asc).deselect(:id)
Department.select(:name).order(name: :asc)
Department.find(10)
Department.first(10)
Department.first(10).order(:hod_id)
Department.take(10).order(:hod_id)
Department.order(:hod_id).take(20)
Department.order(:hod_id).last
Department.order(:hod_id).last(20)
Department.find_by(hod:"")
Department.find_by(hod:"Jane")
Department.find_by(hod_id:20)
Department.where(hod_id:100)
Department.where(hod_id:90)
Department.where(hod_id:9)

Department.where(hod_id:1)
Department.where(hod_id:4)
Department.all
Department.where(hod_id:5)
Department.all.each do |d|
puts d.name
end

Department.find(20)
Department.find(20, 30)

Department.find(20..30)
Department.find(20,30, 40)
Department.take(10)
Department.take!(10)
Department.take(10)!
