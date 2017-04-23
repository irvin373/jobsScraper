require 'nokogiri'
require 'open-uri'

def getJobsFromLosTiempos(url)
	doc = Nokogiri::HTML(open(url))
	doc.css('.views-row', '.views-row-1' ,'.destaq1')
end

def getDataJobLosTiempos(job)
	title = job.css('.title').text.strip
	content = job.css('.field-content').text.strip
	image = nil
	# if !job.css('.image-style-clasificado-img').nil? 
	# 	image = job.css('.image-style-clasificado-img').attribute('src').value
	# end
	puts "titulo: #{title} \n contenido: #{content} \n imagen: #{image}"
end

def showAllLosTiempos(jobs)
	jobs.each do |job|
		getDataJobLosTiempos(job)
	end
end

def getJobFromTrabajopolis(url)
	doc = Nokogiri::HTML(open(url))
	doc.css('.priorityListing', '.evenrow')
end

def getDataJobTrabajopolis(job)
	job = job.css('.anuncio-estandar-content')
	title = job.css('b').text
	busines = job.css('.anuncio-estandar-empresa').text
	if busines == 'Jalasoft'
		puts "titulo: #{title} \n contenido: #{busines} \n"
		
	end
end

def showAllTrabajopolis(jobs)
	jobs.each do |job|
		getDataJobTrabajopolis(job)
	end
end

# losTiempos = 'http://clasificados.lostiempos.com/empleos-trabajos/tipo-trabajo/sistemas-ti-ingenieria-2099/ubicacion/cochabamba-2027'
# jobs = getJobsFromLosTiempos(losTiempos)
# showAllLosTiempos(jobs)

trabajopolis = "http://www.trabajopolis.bo/search-results-jobs/?listings_order_by=desc&action=search&listing_type%5Bequal%5D=Job&keywords%5Bexact_phrase%5D=&JobCategory%5Bmulti_like%5D%5B%5D=Inform%C3%A1tica&Country%5Bmulti_like%5D%5B%5D=Bolivia&CityBolivia%5Bmulti_like%5D%5B%5D=Cochabamba&RangoSueldo%5Bmulti_like%5D%5B%5D=&PostedWithin%5Bmulti_like%5D%5B%5D=&active_only=1"
jobs = getJobFromTrabajopolis(trabajopolis)
showAllTrabajopolis(jobs)