class Gossip
    attr_accessor :author, :content

    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
        end
    end

    def self.all
        all_gossips = [] #on initialise un array vide
        CSV.read("./db/gossip.csv").each do |line| # crée un gossip avec les infos de la ligne
            all_gossips << Gossip.new(line[0],line[1]) #car David,test 6 => David = line 0 et test 6 = line 1
        end
    return all_gossips
    end

    #renvoie un gossip en fonction d'un id = position dans le tableau. Ce n'est pas la bonne méthode.
	def self.find(id)
		return Gossip.all[id]
	end


end

