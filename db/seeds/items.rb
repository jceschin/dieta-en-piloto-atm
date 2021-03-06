# items.rb

# One gram of protein contains 4 calories,
# a gram of carbohydrate also contains 4 calories,
# and one gram of fat contains 9 calories.

ITEMS_INFO = [
  {
    name: "LASAGNA DE VERDURA Y BOLOGNESA",
    description: "INGREDIENTES: LECHE, HARINA DE TRIGO ENRIQUECIDA SEGÚN LEY 25630 (*), TOMATE PERITA, CARNE VACUNA, AGUA, ESPINACA CONGELADA, QUESO EN BARRA, RICOTA, CEBOLLA, HUEVO, MANTECA, QUESO PARMESANO, SAL Y AZÚCAR.",
    calories: 865,
    proteins: 46,
    fats: 33,
    carbs: 95,
    origin: :seller,
    price: 350,
    categories_keywords: %w[pastas gourmet],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598389922/seeds%20tu%20dieta/seeds%20comodos/lasagna-de-verdura-y-bolognesa_kw5kz6.jpg",
    seller: 'Comodos'
  },
  {
    name: "WOK DE POLLO",
    description: "POLLO, FIDEOS DE POROTO, CEBOLLA, ZANAHORIA, ZAPALLITOS, ZUCCHINI CHOCLO, MORRÓN ROJO, VERDE Y AMARILLO, SALSA DE SOJA (COLORANTE: CARAMELO, CONSERVANTE: INS 202), SALSA DE OSTRAS (RESALTADOR DE SABOR: INS 621, COLORANTE: CARAMELO), AGUA, VINO BLANCO, AZÚCAR, ACEITE DE SÉSAMO, JENGIBRE, ALMIDÓN DE MAÍZ.",
    calories: 202,
    proteins: 28,
    fats: 8,
    carbs: 75,
    origin: :seller,
    price: 375,
    categories_keywords: %w[carnes vegetales oriental pollos],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598389922/seeds%20tu%20dieta/seeds%20comodos/wok-pollo_vrhuta.jpg",
    seller: 'Comodos'
  },
  {
    name: "WOK DE VEGETALES",
    description: "CEBOLLA, ZANAHORIA, FIDEOS DE POROTO, ZAPALLITOS, ZUCCHINI CHOCLO, MORRÓN ROJO, VERDE Y AMARILLO, SALSA DE SOJA (COLORANTE: CARAMELO, CONSERVANTE: INS 202), AGUA, VINO BLANCO, SALSA DE OSTRAS (RESALTADOR DE SABOR: INS 621, COLORANTE: CARAMELO), AZÚCAR, ACEITE DE SÉSAMO, ALMIDÓN DE MAÍZ, JENGIBRE.",
    calories: 206,
    proteins: 6,
    fats: 3,
    carbs: 40,
    origin: :seller,
    price: 340,
    categories_keywords: %w[vegetales oriental],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598389922/seeds%20tu%20dieta/seeds%20comodos/wok_ktei7s.jpg",
    seller: 'Comodos'
  },
  {
    name: "SALMÓN ROSADO CON PAPAS Y SALSA CÍTRICA",
    description: "SALMÓN ROSADO, PAPA, VINO BLANCO, LIMÓN, CREMA DE LECHE, ZANAHORIA, AGUA, CEBOLLA, HARINA DE TRIGO ENRIQUECIDA SEGÚN LEY 25630 (*), MANTECA, AZÚCAR, CALDO DE GALLINA (RESALTADORES DE SABOR: GLUTAMATO MONOSODICO E INOSINATO DISÓDICO, AROMATIZANTE/ SABORIZANTE, COLORANTE: CARAMELO, ACIDULANTE: ÁCIDO CÍTRICO), AJO, SAL.",
    calories: 478,
    proteins: 46,
    fats: 14,
    carbs: 42,
    origin: :seller,
    price: 700,
    categories_keywords: %w[pescados gourmet],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598389922/seeds%20tu%20dieta/seeds%20comodos/salmon-papas_ld7sfg.jpg",
    seller: 'Comodos'
  },
  {
    name: "PAELLA DE MARISCOS Y POLLO",
    description: "ARROZ, POLLO, LANGOSTINO PELADO, CALAMAR, MEJILLONES PELADOS, CEBOLLA, TOMATE, PIMIENTO ROJO, PIMIENTO VERDE, CALDO DE PESCADO DESHIDRATADO (RESALTADOR DE SABOR: INS 621, INS 631, ACIDULANTE: INS 330), ACEITE VEGETAL, SAL, CÚRCUMA, PIMENTÓN DULCE.",
    calories: 466,
    proteins: 36,
    fats: 15,
    carbs: 49,
    origin: :seller,
    price: 475,
    categories_keywords: %w[pescados pollos],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598389922/seeds%20tu%20dieta/seeds%20comodos/paella_z2ijs3.jpg",
    seller: 'Comodos'
  },
  {
    name: "Pechuga de pollo al verdeo con batatas y zanahorias asadas",
    description: "Pechuga de pollo, cebolla de verdeo, leche descremada, ajo, caldo de gallina, maizena, zanahoria, batata, aceite de girasol, sal fina.",
    calories: 423,
    proteins: 28,
    fats: 23,
    carbs: 36,
    origin: :seller,
    price: 390,
    categories_keywords: %w[carnes pollos],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598388583/seeds%20tu%20dieta/pechuga-al-verdeo-con-zanahoria-bat-600x600_unpr1w.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Milanesa de cerdo con brócoli y papas cuña",
    description: "Milanesa de cerdo: Carré de cerdo, batter, rebozador, avena, copos de maíz sin azúcar.",
    calories: 482,
    proteins: 28,
    fats: 22,
    carbs: 44,
    origin: :seller,
    price: 445,
    categories_keywords: %w[carnes gourmet],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598388581/seeds%20tu%20dieta/brocoli-calabazas-600x600_mtspyc.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Fitbowl de pollo calabazas asadas berenjenas lentejas y porotos",
    description: "Pechuga de pollo, zapallo, lentejas, porotos, cebolla, semillas de girasol, agua, ajo, romero fresco, aceite de girasol, sal fina, jugo de limón, cilantro fresco.",
    calories: 422,
    proteins: 37,
    fats: 11,
    carbs: 45,
    origin: :seller,
    price: 385,
    categories_keywords: %w[ensaladas vegetales pollos],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598388582/seeds%20tu%20dieta/fitbowl-lentejas-calabaza-pollo-600x600_jba6u1.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Fitbowl de quinoa garbanzos zanahoria repolllo y arvejas",
    description: "Ingredientes: Quinoa, garbanzos, zanahoria, repollo morado, arvejas, cebolla, ajo, aceite de girasol, albahaca, pimentón, romero fresco, tomillo fresco, nuez moscada, agua, jugo de limón, cilantro fresco, sal fina.",
    calories: 258,
    proteins: 13,
    fats: 8,
    carbs: 38,
    origin: :seller,
    price: 365,
    categories_keywords: %w[ensaladas vegetales],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598388581/seeds%20tu%20dieta/fitbowl-quinoa-repollo-600x600_v6i18l.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Suprema napolitana al horno con cremoso de papa",
    description: "Pechuga de pollo, pan rallado, harina de maíz, copos de maíz sin azúcar, huevo, jamón, muzzarella, cebolla,aceite de oliva, ajo, caldo de verdura, laurel, azúcar, miel, albahaca,pimienta negra, anchoa,ajo deshidratado,tomate deshidratado, sal.",
    calories: 860,
    proteins: 64,
    fats: 29,
    carbs: 86,
    origin: :seller,
    price: 440,
    categories_keywords: %w[carnes pollos],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598388583/seeds%20tu%20dieta/suprema-napolitana-600x600_iqeqaj.png",
    seller: 'Simpleat'
  },
  {
    name: "Pechuga al limón c/ soufflé de espinaca",
    description: "Pechuga marinada con jugo de limón fresco, hierbas acompañado de nuestro soufflé de espinaca.",
    calories: 396,
    proteins: 53,
    fats: 19,
    carbs: 3,
    origin: :seller,
    price: 425,
    categories_keywords: %w[carnes],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598388582/seeds%20tu%20dieta/pechuga-souffle-600x600_bo1m66.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Tarta de pollo y puerro con masa integral",
    description: "Fusilli, choclo, cebolla, morrón amarillo, leche descremada, aceite de girasol, caldo de verdura, ajo, tomillo fresco.",
    calories: 740,
    proteins: 38,
    fats: 43,
    carbs: 51,
    origin: :seller,
    price: 410,
    categories_keywords: %w[carnes pollos],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598388137/seeds%20tu%20dieta/tarta-de-pollo-queso-600x600_bifwyy.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Fusilli con salsa de choclo",
    description: "Fusilli, choclo, cebolla, morrón amarillo, leche descremada, aceite de girasol, caldo de verdura, ajo, tomillo fresco.",
    calories: 380,
    proteins: 10,
    fats: 20,
    carbs: 45,
    origin: :seller,
    price: 360,
    categories_keywords: %w[pastas],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598388137/seeds%20tu%20dieta/fusili-para-web-600x600_y1npqd.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Milanesa de carne c/ arroz con vegetales",
    description: "Milanesa de carne rebozada en semillas con arroz con vegetales",
    calories: 367,
    proteins: 25,
    fats: 19,
    carbs: 28,
    origin: :seller,
    price: 435,
    categories_keywords: %w[carnes],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598388137/seeds%20tu%20dieta/2milanesa-carne-arroz-vegetales-600x600_o8hfrh.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Choco Cake",
    description: "Queso crema light, dulce de leche sin azúcar, chocolate sin azúcar, avena, miel, clara de huevo, cacao en polvo.",
    calories: 279,
    proteins: 9,
    fats: 11,
    carbs: 48,
    origin: :seller,
    price: 190,
    categories_keywords: %w[postres],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598387815/seeds%20tu%20dieta/chococake-600x600_egmrxg.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Bombón de Coco",
    description: "Almendras, chocolate sin azúcar, clara de huevo, dulce de leche sin azúcar, huevo, stevia, coco rallado.",
    calories: 269,
    proteins: 7,
    fats: 15,
    carbs: 33,
    origin: :seller,
    price: 190,
    categories_keywords: %w[postres],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598387814/seeds%20tu%20dieta/havanette-600x600_d3jxyd.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Cheesecake de Dulce de Leche",
    description: "Avena, huevo, queso crema light, dulce de leche sin azúcar, cacao en polvo, clara de huevo, chocolate sin azúcar.",
    calories: 258,
    proteins: 9,
    fats: 10,
    carbs: 43,
    origin: :seller,
    price: 195,
    categories_keywords: %w[postres desayunos],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598387644/seeds%20tu%20dieta/Cheesecake-ddl-600x600_krvcp4.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Chicken balls con avena y salsa mediterránea" ,
    description: "Fantásticas albondigas de pollo con deliciosa salsa mediterranea",
    calories: 442,
    proteins: 30,
    fats: 30,
    carbs: 15,
    origin: :seller,
    price: 250,
    categories_keywords: %w[carnes pollos],
    picture: "https://res.cloudinary.com/dlvvke6ov/image/upload/v1598386265/seeds%20tu%20dieta/chicken-balls-600x600_qu6uoh.jpg",
    seller: 'Simpleat'
  },
  {
    name: "Ensalada Mikonos" ,
    description: "Atún, rúcula, espinaca, aceitunas negras, croutones, palta, tomates y queso sardo...",
    calories: 451,
    proteins: 30,
    fats: 30,
    carbs: 14,
    origin: :seller,
    price: 240,
    categories_keywords: %w[ensaladas pescados],
    picture: "https://res.cloudinary.com/ajtvlggc/image/upload/v1596648435/rh9nfmwoba1hgjxmrx3o.jpg",
    seller: 'Dandy Deli'
  },
  {
    name: "Ensalada Crispy" ,
    description: "Lechuga romana, tomates cherry, pepino, mango, queso mozarella, pechuga de pollo, ajo, sal y pimienta.",
    calories: 285,
    proteins: 24,
    fats: 15,
    carbs: 14,
    origin: :seller,
    price: 270,
    categories_keywords: %w[ensaladas],
    picture: "https://res.cloudinary.com/ajtvlggc/image/upload/v1596648827/r5r5bezu4uaxdalw8nt4.png",
    seller: 'Casa Munay'
  },
  {
    name: "Burger Zarpada" ,
    description: "Doble carne con doble cheddar, mostaza, ketchup y cebolla brunoise.",
    calories: 490,
    proteins: 22,
    fats: 32,
    carbs: 31,
    origin: :seller,
    price: 450,
    categories_keywords: %w[hamburgesas carnes],
    picture: "https://res.cloudinary.com/ajtvlggc/image/upload/v1596649435/dbqozlifg2b2fxwwzrul.png",
    seller: 'Moshu'
  },
  {
    name: "Pasta Bolognese" ,
    description: "pasta aechuga de pollo, aceite de oliva, panceta, cebolla. salsa inglesa",
    calories: 488,
    proteins: 26,
    fats: 25,
    carbs: 37,
    origin: :seller,
    price: 335,
    categories_keywords: %w[pastas carnes pollos],
    picture: "https://res.cloudinary.com/ajtvlggc/image/upload/v1596654426/i30zaepgl1soxwwqk2kc.jpg",
    seller: 'Surris Hill Coffee'
  }
]
