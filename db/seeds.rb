Instrument.destroy_all

instruments = []

30.times do |t|
    new_instrument = {
        title: Faker::Name.last_name,
        price: rand(1000..10000),
        model: "Henrix 40C 40-Inch Cutaway",
        description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
        brand: [ "Fender", "Gibson", "Epiphone", "ESP", "Martin", "Dean", 'Taylor', 'Jackson', 'PRS',  'Ibanez', 'Charvel', 'Washburn' ].sample,
        finish: [ 'Black', 'White', 'Navy', 'Blue', 'Red', 'Clear', 'Satin', 'Yellow', 'Seafoam' ].sample,
        condition: [ 'New', 'Excellent', 'Mint', 'Used', 'Fair', 'Poor' ].sample,
        user_id: [8,9].sample
    }
    instruments.push(new_instrument)
end

Instrument.create(instruments)