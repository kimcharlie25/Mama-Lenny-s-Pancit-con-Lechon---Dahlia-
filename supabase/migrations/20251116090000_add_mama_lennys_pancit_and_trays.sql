/*
  Add Mama Lenny's Pancit, Family & Party Trays to menu_items + variations.

  Notes:
  - We DO NOT provide `id` for menu_items or variations so Postgres will
    auto-generate UUIDs (see existing schema in green_stream.sql).
  - `categories.id` is a text primary key with no default, so we must provide
    stable IDs there; the app uses these IDs in menu_items.category.
*/

-- 1) Categories (only inserted if they don't exist yet)
INSERT INTO public.categories (id, name, icon, sort_order, active)
VALUES
  ('pancit-toppings',        'Pancit Toppings',              '🍜', 10, true),
  ('family-trays-beef',      'Family & Party Trays (Beef)',  '🥩', 20, true),
  ('family-trays-pork',      'Family & Party Trays (Pork)',  '🐖', 21, true),
  ('family-trays-chicken',   'Family & Party Trays (Chicken)','🍗', 22, true),
  ('family-trays-seafood',   'Family & Party Trays (Seafood)','🦐', 23, true),
  ('family-trays-veggies',   'Family & Party Trays (Veggies)','🥦', 24, true),
  ('family-trays-pasta',     'Family & Party Trays (Pasta)', '🍝', 25, true),
  ('specialties-trays',      'Specialties (Trays)',          '🍱', 30, true)
ON CONFLICT (id) DO NOTHING;


-- Helper: everything below uses CTEs so each menu item + its variations are tied
-- together via the id returned from menu_items.


-- 2) PANCIT TOPPINGS

-- Bihon Guisado
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Bihon Guisado',
    'Pancit toppings: Con Lechon, Chicken, Bagnet. Sizes: 1L Tub (2-3 Pax), Bilao 1 (5-6 Pax), Bilao 2 (10-12 Pax), Bilao 3 (14-16 Pax), Bilao 4 (18-20 Pax).',
    199,
    'pancit-toppings',
    true,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Con Lechon - 1L Tub (2-3 Pax)', 285),
  ('Con Lechon - Bilao 1 (5-6 Pax)', 610),
  ('Con Lechon - Bilao 2 (10-12 Pax)', 810),
  ('Con Lechon - Bilao 3 (14-16 Pax)', 1150),
  ('Con Lechon - Bilao 4 (18-20 Pax)', 1550),
  ('Chicken - 1L Tub (2-3 Pax)', 199),
  ('Chicken - Bilao 1 (5-6 Pax)', 475),
  ('Chicken - Bilao 2 (10-12 Pax)', 685),
  ('Chicken - Bilao 3 (14-16 Pax)', 995),
  ('Chicken - Bilao 4 (18-20 Pax)', 1355),
  ('Bagnet - 1L Tub (2-3 Pax)', 235),
  ('Bagnet - Bilao 1 (5-6 Pax)', 535),
  ('Bagnet - Bilao 2 (10-12 Pax)', 775),
  ('Bagnet - Bilao 3 (14-16 Pax)', 1100),
  ('Bagnet - Bilao 4 (18-20 Pax)', 1365)
) AS v(name, price);


-- Special Canton
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Special Canton',
    'Pancit toppings: Con Lechon, Chicken, Bagnet. Sizes: 1L Tub (2-3 Pax), Bilao 1 (5-6 Pax), Bilao 2 (10-12 Pax), Bilao 3 (14-16 Pax), Bilao 4 (18-20 Pax).',
    255,
    'pancit-toppings',
    true,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Con Lechon - 1L Tub (2-3 Pax)', 320),
  ('Con Lechon - Bilao 1 (5-6 Pax)', 695),
  ('Con Lechon - Bilao 2 (10-12 Pax)', 965),
  ('Con Lechon - Bilao 3 (14-16 Pax)', 1200),
  ('Con Lechon - Bilao 4 (18-20 Pax)', 1665),
  ('Chicken - 1L Tub (2-3 Pax)', 255),
  ('Chicken - Bilao 1 (5-6 Pax)', 565),
  ('Chicken - Bilao 2 (10-12 Pax)', 795),
  ('Chicken - Bilao 3 (14-16 Pax)', 965),
  ('Chicken - Bilao 4 (18-20 Pax)', 1255),
  ('Bagnet - 1L Tub (2-3 Pax)', 295),
  ('Bagnet - Bilao 1 (5-6 Pax)', 645),
  ('Bagnet - Bilao 2 (10-12 Pax)', 935),
  ('Bagnet - Bilao 3 (14-16 Pax)', 1165),
  ('Bagnet - Bilao 4 (18-20 Pax)', 1465)
) AS v(name, price);


-- Bihon / Canton
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Bihon / Canton',
    'Pancit toppings: Con Lechon, Chicken, Bagnet. Sizes: 1L Tub (2-3 Pax), Bilao 1 (5-6 Pax), Bilao 2 (10-12 Pax), Bilao 3 (14-16 Pax), Bilao 4 (18-20 Pax).',
    225,
    'pancit-toppings',
    true,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Con Lechon - 1L Tub (2-3 Pax)', 295),
  ('Con Lechon - Bilao 1 (5-6 Pax)', 685),
  ('Con Lechon - Bilao 2 (10-12 Pax)', 895),
  ('Con Lechon - Bilao 3 (14-16 Pax)', 1350),
  ('Con Lechon - Bilao 4 (18-20 Pax)', 1650),
  ('Chicken - 1L Tub (2-3 Pax)', 225),
  ('Chicken - Bilao 1 (5-6 Pax)', 575),
  ('Chicken - Bilao 2 (10-12 Pax)', 795),
  ('Chicken - Bilao 3 (14-16 Pax)', 935),
  ('Chicken - Bilao 4 (18-20 Pax)', 1350),
  ('Bagnet - 1L Tub (2-3 Pax)', 285),
  ('Bagnet - Bilao 1 (5-6 Pax)', 615),
  ('Bagnet - Bilao 2 (10-12 Pax)', 855),
  ('Bagnet - Bilao 3 (14-16 Pax)', 1150),
  ('Bagnet - Bilao 4 (18-20 Pax)', 1550)
) AS v(name, price);


-- Mikki / Bihon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Mikki / Bihon',
    'Pancit toppings: Con Lechon, Chicken, Bagnet. Sizes: 1L Tub (2-3 Pax), Bilao 1 (5-6 Pax), Bilao 2 (10-12 Pax), Bilao 3 (14-16 Pax), Bilao 4 (18-20 Pax).',
    250,
    'pancit-toppings',
    true,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Con Lechon - 1L Tub (2-3 Pax)', 325),
  ('Con Lechon - Bilao 1 (5-6 Pax)', 685),
  ('Con Lechon - Bilao 2 (10-12 Pax)', 875),
  ('Con Lechon - Bilao 3 (14-16 Pax)', 1350),
  ('Con Lechon - Bilao 4 (18-20 Pax)', 1650),
  ('Chicken - 1L Tub (2-3 Pax)', 250),
  ('Chicken - Bilao 1 (5-6 Pax)', 575),
  ('Chicken - Bilao 2 (10-12 Pax)', 765),
  ('Chicken - Bilao 3 (14-16 Pax)', 935),
  ('Chicken - Bilao 4 (18-20 Pax)', 1350),
  ('Bagnet - 1L Tub (2-3 Pax)', 285),
  ('Bagnet - Bilao 1 (5-6 Pax)', 635),
  ('Bagnet - Bilao 2 (10-12 Pax)', 835),
  ('Bagnet - Bilao 3 (14-16 Pax)', 1150),
  ('Bagnet - Bilao 4 (18-20 Pax)', 1550)
) AS v(name, price);


-- Special Palabok
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Special Palabok',
    'Pancit toppings: Con Lechon, Chicken. Sizes: 1L Tub (2-3 Pax), Bilao 1 (5-6 Pax), Bilao 2 (10-12 Pax), Bilao 3 (14-16 Pax), Bilao 4 (18-20 Pax).',
    285,
    'pancit-toppings',
    true,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Con Lechon - 1L Tub (2-3 Pax)', 325),
  ('Con Lechon - Bilao 1 (5-6 Pax)', 720),
  ('Con Lechon - Bilao 2 (10-12 Pax)', 965),
  ('Con Lechon - Bilao 3 (14-16 Pax)', 1350),
  ('Con Lechon - Bilao 4 (18-20 Pax)', 1650),
  ('Chicken - 1L Tub (2-3 Pax)', 285),
  ('Chicken - Bilao 1 (5-6 Pax)', 655),
  ('Chicken - Bilao 2 (10-12 Pax)', 895),
  ('Chicken - Bilao 3 (14-16 Pax)', 1200),
  ('Chicken - Bilao 4 (18-20 Pax)', 1550)
) AS v(name, price);


-- Japchae
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Japchae',
    'Pancit toppings: Con Lechon, Chicken. Sizes: 1L Tub (2-3 Pax), Bilao 1 (5-6 Pax), Bilao 2 (10-12 Pax), Bilao 3 (14-16 Pax), Bilao 4 (18-20 Pax).',
    325,
    'pancit-toppings',
    true,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Con Lechon - 1L Tub (2-3 Pax)', 365),
  ('Con Lechon - Bilao 1 (5-6 Pax)', 655),
  ('Con Lechon - Bilao 2 (10-12 Pax)', 935),
  ('Con Lechon - Bilao 3 (14-16 Pax)', 1465),
  ('Con Lechon - Bilao 4 (18-20 Pax)', 1835),
  ('Chicken - 1L Tub (2-3 Pax)', 325),
  ('Chicken - Bilao 1 (5-6 Pax)', 585),
  ('Chicken - Bilao 2 (10-12 Pax)', 835),
  ('Chicken - Bilao 3 (14-16 Pax)', 1295),
  ('Chicken - Bilao 4 (18-20 Pax)', 1495)
) AS v(name, price);


-- Pancit Puti
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Pancit Puti',
    'Plain pancit puti. Sizes: 1L Tub (2-3 Pax), Bilao 1 (5-6 Pax), Bilao 2 (10-12 Pax), Bilao 3 (14-16 Pax), Bilao 4 (18-20 Pax).',
    195,
    'pancit-toppings',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 195),
  ('Bilao 1 (5-6 Pax)', 485),
  ('Bilao 2 (10-12 Pax)', 695),
  ('Bilao 3 (14-16 Pax)', 885),
  ('Bilao 4 (18-20 Pax)', 1260)
) AS v(name, price);


-- Special Lomi
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Special Lomi',
    'Special lomi with Con Lechon. Sizes: 1L Tub (2-3 Pax), Bilao 1 (5-6 Pax).',
    195,
    'pancit-toppings',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Con Lechon - 1L Tub (2-3 Pax)', 195),
  ('Con Lechon - Bilao 1 (5-6 Pax)', 265)
) AS v(name, price);


-- 3) FAMILY & PARTY TRAYS (BEEF)

WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Beef Morcon (Boiled w/ stuffing)',
    'Beef Morcon. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1499.00,
    'family-trays-beef',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1499.00),
  ('Party Tray (22-25 Pax)', 2799.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Beef Mechado (Chunks in savory tomato sauce)',
    'Beef Mechado. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1399.00,
    'family-trays-beef',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1399.00),
  ('Party Tray (22-25 Pax)', 2699.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Beef Caldereta (With veggies in special sauce)',
    'Beef Caldereta. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1399.00,
    'family-trays-beef',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1399.00),
  ('Party Tray (22-25 Pax)', 2699.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Lengua Estofado (Beef Tongue)',
    'Lengua Estofado. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1499.00,
    'family-trays-beef',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1499.00),
  ('Party Tray (22-25 Pax)', 2799.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Beef Mushroom',
    'Beef mushroom. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1399.00,
    'family-trays-beef',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1399.00),
  ('Party Tray (22-25 Pax)', 2699.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Beef Kare-Kare (With set trio)',
    'Beef Kare-Kare with set trio. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1499.00,
    'family-trays-beef',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1499.00),
  ('Party Tray (22-25 Pax)', 2799.00)
) AS v(name, price);


-- 4) FAMILY & PARTY TRAYS (PORK)

WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Baby Back Ribs (Smoky BBQ sauce)',
    'Baby Back Ribs in smoky BBQ sauce. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1399.00,
    'family-trays-pork',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1399.00),
  ('Party Tray (22-25 Pax)', 2799.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Special Menudo (Liver, pickles, sausage, veggies)',
    'Special Menudo. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-pork',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Embotido (Meat roll w/ pork & stuffing)',
    'Embotido. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-pork',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Bopis (Spicy savory pork lungs & heart)',
    'Bopis. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-pork',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Pork Hamonado (Boiled pork loin w/ syrup)',
    'Pork Hamonado. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-pork',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


-- 5) FAMILY & PARTY TRAYS (CHICKEN)

WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Chicken Teriyaki (Glazed in sweet savory pineapple)',
    'Chicken Teriyaki. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-chicken',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Honey Lemon (Sweet honey lemon glaze)',
    'Honey Lemon Chicken. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-chicken',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Chicken Lollipop (Drumlets and wings)',
    'Chicken Lollipop. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-chicken',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Chicken Pickles (Tangy chicken w/ pickles, pineapple, veggies)',
    'Chicken Pickles. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-chicken',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Chicken Pastel (Chunks, mushrooms & sausages)',
    'Chicken Pastel. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-chicken',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Chicken Fillet (Boiled w/ stuffing)',
    'Chicken Fillet. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-chicken',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


-- 6) FAMILY & PARTY TRAYS (SEAFOOD)

WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Creamy Garlic Prawns',
    'Creamy Garlic Prawns. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1499.00,
    'family-trays-seafood',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1499.00),
  ('Party Tray (22-25 Pax)', 2799.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Buttered Garlic Shrimp',
    'Buttered Garlic Shrimp. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1499.00,
    'family-trays-seafood',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1499.00),
  ('Party Tray (22-25 Pax)', 2799.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Shrimp in Olive Sauce',
    'Shrimp in olive sauce. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1499.00,
    'family-trays-seafood',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1499.00),
  ('Party Tray (22-25 Pax)', 2799.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Steamed Fish (Steamed w/ sour soy)',
    'Steamed Fish. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-seafood',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Kilawing Bangus',
    'Kilawing Bangus. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1399.00,
    'family-trays-seafood',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1399.00),
  ('Party Tray (22-25 Pax)', 2699.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Creamy Sipo Shrimp & Egg',
    'Creamy Sipo Shrimp & Egg. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1499.00,
    'family-trays-seafood',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1499.00),
  ('Party Tray (22-25 Pax)', 2799.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Fish Fillet (Tender, creamy fish fillet w/ tartar sauce)',
    'Fish Fillet. Variations: Family Tray (10-12 Pax), Party Tray (22-25 Pax).',
    1299.00,
    'family-trays-seafood',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (22-25 Pax)', 2499.00)
) AS v(name, price);


-- 7) FAMILY & PARTY TRAYS (VEGGIES)

WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Chopsuey Overload',
    'Chopsuey Overload (cabbage, broccoli, corn, quail eggs, chicken, liver). Variations: Family Tray (10-12 Pax), Party Tray (20-24 Pax).',
    1299.00,
    'family-trays-veggies',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (20-24 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Veggie Spring Roll',
    'Veggie Spring Roll (fried vegetable spring roll w/ crab sauce). Variations: Family Tray (10-12 Pax), Party Tray (20-24 Pax).',
    1299.00,
    'family-trays-veggies',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (20-24 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Butterfly Mix Vegetable',
    'Butterfly Mix Vegetable (carrots, corn, green beans). Variations: Family Tray (10-12 Pax), Party Tray (20-24 Pax).',
    1299.00,
    'family-trays-veggies',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (20-24 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Creamy Mix Veggie & Egg',
    'Creamy Mix Veggie & Egg (creamy mix veggies w/ egg & cream). Variations: Family Tray (10-12 Pax), Party Tray (20-24 Pax).',
    1299.00,
    'family-trays-veggies',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (20-24 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Stir Fry Mix Veggie',
    'Stir Fry Mix Veggie (broccoli, corn, chicharo, mushroom, bell pepper). Variations: Family Tray (10-12 Pax), Party Tray (20-24 Pax).',
    1299.00,
    'family-trays-veggies',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (20-24 Pax)', 2499.00)
) AS v(name, price);


-- 8) FAMILY & PARTY TRAYS (PASTA)

WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Lasagna Roll (Meaty sauce & cheese sauce)',
    'Lasagna Roll. Variations: Family Tray (10-12 Pax), Party Tray (20-24 Pax).',
    1499.00,
    'family-trays-pasta',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1499.00),
  ('Party Tray (20-24 Pax)', 2799.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Baked Spaghetti (Meaty spaghetti w/ baked cheese)',
    'Baked Spaghetti. Variations: Family Tray (10-12 Pax), Party Tray (20-24 Pax).',
    1299.00,
    'family-trays-pasta',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (20-24 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Baked Macaroni (Meaty pasta w/ creamy cheese sauce)',
    'Baked Macaroni. Variations: Family Tray (10-12 Pax), Party Tray (20-24 Pax).',
    1299.00,
    'family-trays-pasta',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (20-24 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Meaty Penne Carbonara (Creamy white & meaty sauce)',
    'Meaty Penne Carbonara. Variations: Family Tray (10-12 Pax), Party Tray (20-24 Pax).',
    1299.00,
    'family-trays-pasta',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1299.00),
  ('Party Tray (20-24 Pax)', 2499.00)
) AS v(name, price);


WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES (
    'Creamy Prawns Parmesan',
    'Creamy Prawns Parmesan. Variations: Family Tray (10-12 Pax), Party Tray (20-24 Pax).',
    1499.00,
    'family-trays-pasta',
    false,
    true
  )
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 Pax)', 1499.00),
  ('Party Tray (20-24 Pax)', 2799.00)
) AS v(name, price);


