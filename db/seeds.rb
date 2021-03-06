seeder = User.find_by(email: 'seeder@example.com')
unless seeder && seeder.drinks.any?
  seeder = User.create(email: 'seeder@example.com')

  seeder.drinks.build(
    [
      {
        name: 'mojito',
        ingredients: ['white rum', 'soda water', 'caster sugar', 'lime', 'mint'],
        description: 'Delivering zesty lime with fresh mint and a backbone of crystal clear, smooth Captain Morgan® White Rum, the classic Mojito cocktail recipe has all the ingredients for a great party – enjoy it with the crew!',
        strength: '3'
      },
      {
        name: 'margarita',
        ingredients: ['tequila', 'orange liqueur', 'lime juice'],
        description: 'Nothing says Mexico like the Margarita, an elegant blend of tequila, fresh lime and orange, served in a salt-rimmed glass – and the last of the great classic cocktails.',
        strength: '3'
      },
      {
        name: 'sex on the beach',
        ingredients: ['peach schnapps', 'vodka', 'orange juice', 'cranberry juice'],
        description: 'A modern classic, Sex on the Beach has a name you won’t forget, but one that shouldn’t hide the qualities of subtly sweet fruit plus a backbone of clean, smooth vodka.',
        strength: '3'
      },
      {
        name: 'blue lagoon',
        ingredients: ['vodka', 'blue curaçao liqueur', 'lemonade', 'lemon'],
        description: 'A brilliant, turquoise 1970s classic, the Blue Lagoon may look and sound tropical, but its a deliciously tangy, citrus harmony of vodka, blue curaçao and lemonade.',
        strength: '3'
      },
      {
        name: 'old fashioned',
        ingredients: ['whisky', 'angostura bitters', 'sugar', 'cherry', 'orange'],
        description: 'A version of one of the all-time classic cocktails switches in Johnnie Walker Black Label for a smoky edge to the stirred mixture. Its one of the most elegant ways to savour this great whisky.',
        strength: '5'
      },
      {
        name: 'kir',
        ingredients: ['vodka', 'blossom hill sun-kissed white', 'crème'],
        description: 'If wine your tipple of choice and think cocktails are too much hassle, then we might just have the perfect compromise – the Kir cocktail. Its made by mixing white wine and blackcurrant liqueur together and while it sounds too simple to be true, one thing we can guarantee is that it doesnt compromise on flavour.',
        strength: '2'
      },
      {
        name: 'cuba libre',
        ingredients: ['rum', 'cola', 'lime', 'lemon'],
        description: 'Simple, delicious and so much more than just a rum and cola, the Cuba Libre probably dates back to 1900, a few months after a new-fangled drink called cola arrived in Cuba.',
        strength: '3'
      },
      {
        name: 'fireman',
        ingredients: ['rum', 'lime juice', 'grenadine', 'egg white', 'lime'],
        description: 'Startlingly smooth, refreshingly tangy, with rich, dark Captain Morgan rum and a hint of fragrant pomegranate from a pour of grenadine, the Fireman takes the classic sour to a whole new level.',
        strength: '3'
      },
      {
        name: 'sazerac',
        ingredients: ['burbon', 'sugar', 'peychauds bitters', 'angostura bitters', 'absinthe', 'lemon peel'],
        description: 'Herbal, aromatic and deliciously bittersweet, the Sazerac cocktail is a New Orleans icon thats crafted using a careful ritual, one that makes it testing but rewarding – perhaps the ultimate vintage cocktail recipe.',
        strength: '4'
      },
      {
        name: 'aviation',
        ingredients: ['gin', 'maraschino liqueur', 'créme de violette', 'lemon juice'],
        description: 'A great mix of flavours, the Aviation cocktail is the perfect introduction to gin cocktails. This citrussy, lightly floral blend of gin, maraschino and lemon is a classic cocktail recipe from the Jazz Age, when aeroplanes were the latest thing and exotic enough to inspire bartenders.',
        strength: '3'
      },
      {
        name: 'alabama slammer',
        ingredients: ['gin', 'southern comfort', 'amaretto liqueur', 'orange juice', 'orange slice'],
        description: 'Rich almond notes, fruity Gordons Sloe Gin and fresh orange meld for this fruit-and-nut classic thats perfect for parties – on the rocks or as a shooter.',
        strength: '2'
      },
      {
        name: 'cosmopolitan',
        ingredients: ['vodka', 'orange liqueur', 'lime twist', 'cranberry juice', 'lime juice'],
        description: 'There are some – a very few – cocktails that define a decade. And the Cosmopolitan, a hot pink, pleasantly sharp cocktail served in the iconic martini glass, was the essence of the 1990s.',
        strength: '2'
      },
      {
        name: 'moscow mule',
        ingredients: ['vodka', 'ginger beer', 'angostura bitters', 'lime juice'],
        description: 'With pure, clean vodka, spicy ginger and zingy lime, the Moscow Mule cocktail sparked the vodka craze of the 1950s and the popularity of this great white spirit ever since.',
        strength: '4'
      },
      {
        name: 'bloody mary',
        ingredients: ['vodka', 'tomato juice', 'tabasco sauce', 'worcestershire sauce', 'pepper', 'celery', 'lemon wedge'],
        description: 'The ultimate brunch cocktail, the worlds favourite savoury drink, the Bloody Mary delivers a balance of sweet, salt, sour and umami flavours that is unlike any other.',
        strength: '3'
      },
      {
        name: 'perfect martini',
        ingredients: ['gin', 'vermouth'],
        description: 'The classic martini cocktail, a dry blend of great gin such as Tanqueray London Dry Gin, plus vermouth, is one of the worlds simplest mixed drinks – and probably its most famous.',
        strength: '3'
      },
      {
        name: 'arizona sunset',
        ingredients: ['ice', 'grenadine', 'spirte', 'orange juice'],
        description: 'Arizona Sunset is a fun and fruity, non-alcoholic drink, perfect for warmer weather - its reminiscent of Arizonas awesomely beautiful sunsets! Since there is no alcohol, its great for adults and kids!',
        strength: '1'
      },
      {
        name: 'coconut lavender lemonade',
        ingredients: ['lemon juice', 'sugar', 'coconut water', 'water', 'lavender syrup'],
        description: 'Summer has it’s many days of sunshine and fun adventures, but keeping refreshed is something that can never be taken for granted. This beverage recipe is my favorite for those sun lounging days. Tropical, herbal, sweet, and satisfying!',
        strength: '1'
      },
      {
        name: 'millionaire sour',
        ingredients: ['lemon syrup', 'gigner ale', 'crushed ice', 'grenadine', 'lemon slice'],
        description: 'A terribly classy thing to sip. The recipe advises using ginger ale instead of Irish whiskey to make it non-alcoholic and super tasty.',
        strength: '1'
      },
      {
        name: 'mexican lemonade',
        ingredients: ['water', 'sprite', 'sugar', 'lemon juice', 'crushed ice'],
        description: 'Delicious mexican lemonade that will fresh you up in the hot summer days.',
        strength: '1'
      },
      {
        name: 'passion fruit drink',
        ingredients: ['mint leaves', 'lime juice', 'ginger ale', 'orange juice', 'ice', 'sparkling soda'],
        description: 'Zingy, fresh and delicious, nothing to say more. You just need to try it.',
        strength: '1'
      },
    ]
  )

  seeder.save
end
