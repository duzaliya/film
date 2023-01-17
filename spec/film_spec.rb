require "film"

describe Film do
  let(:film) { Film.new("Рассказ служанки", "Брюс Миллер", 2017) }

  describe ".new" do
    it "assigns instance variables" do
      expect(film.title).to eq "Рассказ служанки"
      expect(film.director).to eq "Брюс Миллер"
      expect(film.premiere_year).to eq 2017
    end
  end

  describe "#full_name" do
    it "returns the full_name of the film as a string" do
      expect(film.full_name).to eq "Брюс Миллер - Рассказ служанки (2017)"
    end
  end
end
