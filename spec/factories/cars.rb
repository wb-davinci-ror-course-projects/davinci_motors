
FactoryGirl.define do
  factory :car do
    makes_models = {
      'Ford' => 'Edsel',
      'Daihatsu' => 'Rocky',
      'Suzuki' => 'Esteem',
      'Mitsubishi' => 'Aspire',
      'AMC' => 'Gremlin',
      'Dodge' => 'Scamp',
      'Honda' => 'Jazz',
      'Mazda' => 'Bongo',
      'Isuzu' => 'Big Horn',
      'Toyota' => 'Stout'
    }
    make_model = makes_models.to_a[(0..9).to_a.sample]
    make { make_model[0] }
    model { make_model[1] }
    year { (1900..2014).to_a.sample }
    price { (250..10_000).to_a.sample }
  end
end
# http://www.weirdcrap.com/scholarly/carnames.html
