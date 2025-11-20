/*
  Add complete Mama Lenny's menu (updated structure).
  
  - categories.id is a text primary key with no default, so we MUST supply those.
  - menu_items.id and variations.id are UUID with DEFAULT gen_random_uuid(), so
    we omit `id` in INSERTs and let Postgres auto-generate them.
  - description is required (NOT NULL), so we insert an empty string '' as requested.
*/

-- 1) Categories
INSERT INTO public.categories (id, name, icon, sort_order, active) VALUES
  ('pancit-toppings', 'Pancit Toppings', '🍜', 10, true),
  ('family-trays-beef', 'Family & Party Trays (Beef)', '🥩', 20, true),
  ('family-trays-pork', 'Family & Party Trays (Pork)', '🐖', 21, true),
  ('family-trays-chicken', 'Family & Party Trays (Chicken)', '🍗', 22, true),
  ('family-trays-seafood', 'Family & Party Trays (Seafood)', '🦐', 23, true),
  ('family-trays-veggies', 'Family & Party Trays (Vegetables)', '🥦', 24, true),
  ('family-trays-pasta', 'Family & Party Trays (Pasta)', '🍝', 25, true),
  ('specialties-trays', 'Specialties (Trays - Same Day Order)', '🍱', 30, true),
  ('specialties-tub', 'Specialties (A la Carte)', '🥘', 31, true),
  ('snacks', 'Snacks', '🍢', 40, true),
  ('desserts', 'Desserts', '🍮', 50, true),
  ('party-packages', 'Party Packages', '🎁', 60, true)
ON CONFLICT (id) DO NOTHING;


-- Helper pattern used below:
--   WITH item AS (
--     INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
--     VALUES ('Name', '', base_price_numeric, 'category-id', false, true)
--     RETURNING id
--   )
--   INSERT INTO public.variations (menu_item_id, name, price)
--   SELECT item.id, v.name, v.price
--   FROM item, LATERAL (VALUES (...)) AS v(name, price);


-- 2) PANCIT TOPPINGS

-- BIHON GUISADO Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BIHON GUISADO Con Lechon', '', 285, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 285),
  ('Bilao 2 (Good for 5-6 pax)', 610),
  ('Bilao 3 (Good for 10-12 pax)', 810),
  ('Bilao 4 (Good for 16-18 pax)', 1150),
  ('Bilao 5 (Good for 25-30 pax)', 1550)
) AS v(name, price);

-- BIHON GUISADO Chicken
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BIHON GUISADO Chicken', '', 199, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 199),
  ('Bilao 2 (Good for 5-6 pax)', 475),
  ('Bilao 3 (Good for 10-12 pax)', 685),
  ('Bilao 4 (Good for 16-18 pax)', 895),
  ('Bilao 5 (Good for 25-30 pax)', 1365)
) AS v(name, price);

-- BIHON GUISADO Bagnet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BIHON GUISADO Bagnet', '', 235, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 235),
  ('Bilao 2 (Good for 5-6 pax)', 535),
  ('Bilao 3 (Good for 10-12 pax)', 775),
  ('Bilao 4 (Good for 16-18 pax)', 1100),
  ('Bilao 5 (Good for 25-30 pax)', 1365)
) AS v(name, price);

-- BIHON GUISADO Plain
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BIHON GUISADO Plain', '', 199, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 199),
  ('Bilao 2 (Good for 5-6 pax)', 475),
  ('Bilao 3 (Good for 10-12 pax)', 685),
  ('Bilao 4 (Good for 16-18 pax)', 895),
  ('Bilao 5 (Good for 25-30 pax)', 1365)
) AS v(name, price);

-- SPECIAL CANTON Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL CANTON Con Lechon', '', 320, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 320),
  ('Bilao 2 (Good for 5-6 pax)', 695),
  ('Bilao 3 (Good for 10-12 pax)', 965),
  ('Bilao 4 (Good for 16-18 pax)', 1200),
  ('Bilao 5 (Good for 25-30 pax)', 1665)
) AS v(name, price);

-- SPECIAL CANTON Chicken
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL CANTON Chicken', '', 255, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 255),
  ('Bilao 2 (Good for 5-6 pax)', 565),
  ('Bilao 3 (Good for 10-12 pax)', 795),
  ('Bilao 4 (Good for 16-18 pax)', 945),
  ('Bilao 5 (Good for 25-30 pax)', 1255)
) AS v(name, price);

-- SPECIAL CANTON Bagnet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL CANTON Bagnet', '', 295, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 295),
  ('Bilao 2 (Good for 5-6 pax)', 645),
  ('Bilao 3 (Good for 10-12 pax)', 935),
  ('Bilao 4 (Good for 16-18 pax)', 1165),
  ('Bilao 5 (Good for 25-30 pax)', 1465)
) AS v(name, price);

-- SPECIAL CANTON Plain
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL CANTON Plain', '', 255, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 255),
  ('Bilao 2 (Good for 5-6 pax)', 565),
  ('Bilao 3 (Good for 10-12 pax)', 795),
  ('Bilao 4 (Good for 16-18 pax)', 945),
  ('Bilao 5 (Good for 25-30 pax)', 1255)
) AS v(name, price);

-- BIHON / CANTON Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BIHON / CANTON Con Lechon', '', 295, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 295),
  ('Bilao 2 (Good for 5-6 pax)', 685),
  ('Bilao 3 (Good for 10-12 pax)', 895),
  ('Bilao 4 (Good for 16-18 pax)', 1350),
  ('Bilao 5 (Good for 25-30 pax)', 1650)
) AS v(name, price);

-- BIHON / CANTON Chicken
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BIHON / CANTON Chicken', '', 225, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 225),
  ('Bilao 2 (Good for 5-6 pax)', 575),
  ('Bilao 3 (Good for 10-12 pax)', 765),
  ('Bilao 4 (Good for 16-18 pax)', 935),
  ('Bilao 5 (Good for 25-30 pax)', 1350)
) AS v(name, price);

-- BIHON / CANTON Bagnet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BIHON / CANTON Bagnet', '', 285, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 285),
  ('Bilao 2 (Good for 5-6 pax)', 615),
  ('Bilao 3 (Good for 10-12 pax)', 855),
  ('Bilao 4 (Good for 16-18 pax)', 1150),
  ('Bilao 5 (Good for 25-30 pax)', 1550)
) AS v(name, price);

-- BIHON / CANTON Plain
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BIHON / CANTON Plain', '', 225, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 225),
  ('Bilao 2 (Good for 5-6 pax)', 575),
  ('Bilao 3 (Good for 10-12 pax)', 765),
  ('Bilao 4 (Good for 16-18 pax)', 935),
  ('Bilao 5 (Good for 25-30 pax)', 1350)
) AS v(name, price);

-- MIKKI / BIHON Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('MIKKI / BIHON Con Lechon', '', 325, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 325),
  ('Bilao 2 (Good for 5-6 pax)', 685),
  ('Bilao 3 (Good for 10-12 pax)', 875),
  ('Bilao 4 (Good for 16-18 pax)', 1350),
  ('Bilao 5 (Good for 25-30 pax)', 1650)
) AS v(name, price);

-- MIKKI / BIHON Chicken
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('MIKKI / BIHON Chicken', '', 225, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 225),
  ('Bilao 2 (Good for 5-6 pax)', 575),
  ('Bilao 3 (Good for 10-12 pax)', 765),
  ('Bilao 4 (Good for 16-18 pax)', 935),
  ('Bilao 5 (Good for 25-30 pax)', 1350)
) AS v(name, price);

-- MIKKI / BIHON Bagnet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('MIKKI / BIHON Bagnet', '', 285, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 285),
  ('Bilao 2 (Good for 5-6 pax)', 635),
  ('Bilao 3 (Good for 10-12 pax)', 835),
  ('Bilao 4 (Good for 16-18 pax)', 1150),
  ('Bilao 5 (Good for 25-30 pax)', 1550)
) AS v(name, price);

-- MIKKI / BIHON Plain
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('MIKKI / BIHON Plain', '', 225, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 225),
  ('Bilao 2 (Good for 5-6 pax)', 575),
  ('Bilao 3 (Good for 10-12 pax)', 765),
  ('Bilao 4 (Good for 16-18 pax)', 935),
  ('Bilao 5 (Good for 25-30 pax)', 1350)
) AS v(name, price);

-- SPECIAL PALABOK Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL PALABOK Con Lechon', '', 285, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 285),
  ('Bilao 2 (Good for 5-6 pax)', 720),
  ('Bilao 3 (Good for 10-12 pax)', 965),
  ('Bilao 4 (Good for 16-18 pax)', 1350),
  ('Bilao 5 (Good for 25-30 pax)', 1650)
) AS v(name, price);

-- SPECIAL PALABOK Bagnet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL PALABOK Bagnet', '', 235, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 235),
  ('Bilao 2 (Good for 5-6 pax)', 645),
  ('Bilao 3 (Good for 10-12 pax)', 895),
  ('Bilao 4 (Good for 16-18 pax)', 1200),
  ('Bilao 5 (Good for 25-30 pax)', 1550)
) AS v(name, price);

-- SPECIAL PALABOK Plain
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL PALABOK Plain', '', 235, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 235),
  ('Bilao 2 (Good for 5-6 pax)', 645),
  ('Bilao 3 (Good for 10-12 pax)', 895),
  ('Bilao 4 (Good for 16-18 pax)', 1200),
  ('Bilao 5 (Good for 25-30 pax)', 1550)
) AS v(name, price);

-- JAPCHAE Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('JAPCHAE Con Lechon', '', 365, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 365),
  ('Bilao 2 (Good for 5-6 pax)', 655),
  ('Bilao 3 (Good for 10-12 pax)', 935),
  ('Bilao 4 (Good for 16-18 pax)', 1465),
  ('Bilao 5 (Good for 25-30 pax)', 1835)
) AS v(name, price);

-- JAPCHAE Chicken
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('JAPCHAE Chicken', '', 325, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 325),
  ('Bilao 2 (Good for 5-6 pax)', 585),
  ('Bilao 3 (Good for 10-12 pax)', 835),
  ('Bilao 4 (Good for 16-18 pax)', 1295),
  ('Bilao 5 (Good for 25-30 pax)', 1495)
) AS v(name, price);

-- JAPCHAE Plain
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('JAPCHAE Plain', '', 325, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 325),
  ('Bilao 2 (Good for 5-6 pax)', 585),
  ('Bilao 3 (Good for 10-12 pax)', 835),
  ('Bilao 4 (Good for 16-18 pax)', 1295),
  ('Bilao 5 (Good for 25-30 pax)', 1495)
) AS v(name, price);

-- PANCIT PUTI
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PANCIT PUTI', '', 195, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 195),
  ('Bilao 2 (Good for 5-6 pax)', 485),
  ('Bilao 3 (Good for 10-12 pax)', 695),
  ('Bilao 4 (Good for 16-18 pax)', 885),
  ('Bilao 5 (Good for 25-30 pax)', 1260)
) AS v(name, price);

-- SPECIAL LOMI Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL LOMI Con Lechon', '', 265, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 265)
) AS v(name, price);

-- SPECIAL LOMI Plain
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL LOMI Plain', '', 195, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 ML Tub (Good for 1-2 pax)', 195)
) AS v(name, price);


-- 3) SPECIALTIES (A la Carte)

-- CRISPY ULO
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CRISPY ULO', '', 999, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 999)
) AS v(name, price);

-- CRISPY PATA SUPER JUMBO
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CRISPY PATA SUPER JUMBO', '', 799, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 799)
) AS v(name, price);

-- BINAGOONGAN BAGNET
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BINAGOONGAN BAGNET', '', 399, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 399)
) AS v(name, price);

-- CRISPY BAGNET
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CRISPY BAGNET', '', 399, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 399)
) AS v(name, price);

-- ROSEMARY CHICKEN
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('ROSEMARY CHICKEN', '', 549, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 549)
) AS v(name, price);

-- PORK SISIG
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PORK SISIG', '', 270, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 270)
) AS v(name, price);

-- CHICHARON BULAKLAK
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHICHARON BULAKLAK', '', 235, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 235)
) AS v(name, price);

-- CORDON BLEU
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CORDON BLEU', '', 420, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 420)
) AS v(name, price);

-- SPECIAL CHOPSUEY
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL CHOPSUEY', '', 235, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 235)
) AS v(name, price);

-- CHOPSUEY CON LECHON
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHOPSUEY CON LECHON', '', 330, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 330)
) AS v(name, price);

-- SHANGHAI ROLLS (10 Pieces)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SHANGHAI ROLLS (10 Pieces)', '', 240, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('10 Pieces', 240)
) AS v(name, price);

-- DYNAMITE (10 Pieces)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('DYNAMITE (10 Pieces)', '', 240, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('10 Pieces', 240)
) AS v(name, price);

-- CRISPY TAWILIS
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CRISPY TAWILIS', '', 220, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 220)
) AS v(name, price);

-- TOFU SISIG
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('TOFU SISIG', '', 149, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 149)
) AS v(name, price);

-- TOFU SWEET AND SOUR
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('TOFU SWEET AND SOUR', '', 149, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 149)
) AS v(name, price);

-- SIZZLING TOFU
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SIZZLING TOFU', '', 159, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1,000 mL Tub', 159)
) AS v(name, price);


-- 4) SNACKS

-- FRESH LUMPIA
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('FRESH LUMPIA', '', 89, 'snacks', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Solo', 89)
) AS v(name, price);

-- CHEESE STICKS
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHEESE STICKS', '', 89, 'snacks', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Solo', 89)
) AS v(name, price);

-- PALABOK (Solo)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PALABOK (Solo)', '', 129, 'snacks', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Solo', 129)
) AS v(name, price);

-- CHICKEN MAMI
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHICKEN MAMI', '', 129, 'snacks', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Solo', 129)
) AS v(name, price);

-- BUTTERED PUTO BOX
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BUTTERED PUTO BOX', '', 180, 'snacks', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Box', 180)
) AS v(name, price);


-- 5) DESSERTS

-- BUTTERED PUTO
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BUTTERED PUTO', '', 15, 'desserts', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Per Piece', 15)
) AS v(name, price);

-- PUTO CAKE 12"
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PUTO CAKE 12"', '', 420, 'desserts', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('12" Made to Order', 420)
) AS v(name, price);

-- SAPIN-SAPIN 12"
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SAPIN-SAPIN 12"', '', 650, 'desserts', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('12" Made to Order', 650)
) AS v(name, price);

-- SAPIN-SAPIN SOLO
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SAPIN-SAPIN SOLO', '', 130, 'desserts', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Solo', 130)
) AS v(name, price);

-- TURON DE SAPI-SAPIN
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('TURON DE SAPI-SAPIN', '', 75, 'desserts', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('3 pcs', 75),
  ('6 pcs', 150),
  ('10 pcs', 250)
) AS v(name, price);


-- 6) BEEF (Family & Party Trays)

-- BEEF MORCON
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BEEF MORCON', '', 1499, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1499),
  ('Party Tray (22-25 pax)', 2799)
) AS v(name, price);

-- BEEF MECHADO
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BEEF MECHADO', '', 1399, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1399),
  ('Party Tray (22-25 pax)', 2699)
) AS v(name, price);

-- BEEF CALDERETA
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BEEF CALDERETA', '', 1399, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1399),
  ('Party Tray (22-25 pax)', 2699)
) AS v(name, price);

-- LENGUA ESTOFADO
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('LENGUA ESTOFADO', '', 1499, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1499),
  ('Party Tray (22-25 pax)', 2799)
) AS v(name, price);

-- BEEF MUSHROOM
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BEEF MUSHROOM', '', 1399, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1399),
  ('Party Tray (22-25 pax)', 2699)
) AS v(name, price);

-- BEEF KARE-KARE
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BEEF KARE-KARE', '', 1499, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1499),
  ('Party Tray (22-25 pax)', 2799)
) AS v(name, price);


-- 7) PORK (Family & Party Trays)

-- BABY BACK RIBS
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BABY BACK RIBS', '', 1399, 'family-trays-pork', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1399),
  ('Party Tray (22-25 pax)', 2799)
) AS v(name, price);

-- SPECIAL MENUDO
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL MENUDO', '', 1299, 'family-trays-pork', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);

-- EMBOTIDO
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('EMBOTIDO', '', 1299, 'family-trays-pork', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);

-- BOKIS
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BOKIS', '', 1299, 'family-trays-pork', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);

-- PORK HAMONADO
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PORK HAMONADO', '', 1299, 'family-trays-pork', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);


-- 8) CHICKEN (Family & Party Trays)

-- CHICKEN TERIYAKI
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHICKEN TERIYAKI', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);

-- HONEY LEMON
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('HONEY LEMON', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);

-- CHICKEN LOLLIPOP
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHICKEN LOLLIPOP', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);

-- CHICKEN PICKLES
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHICKEN PICKLES', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);

-- CHICKEN PASTEL
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHICKEN PASTEL', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);

-- CHICKEN FILLET
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHICKEN FILLET', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);


-- 9) SEA FOODS (Family & Party Trays)

-- CREAMY GARLIC PRAWNS
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CREAMY GARLIC PRAWNS', '', 1499, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1499),
  ('Party Tray (22-25 pax)', 2799)
) AS v(name, price);

-- BUTTERED GARLIC SHRIMP
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BUTTERED GARLIC SHRIMP', '', 1499, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1499),
  ('Party Tray (22-25 pax)', 2799)
) AS v(name, price);

-- SHRIMP IN OLIVE SAUCE
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SHRIMP IN OLIVE SAUCE', '', 1499, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1499),
  ('Party Tray (22-25 pax)', 2799)
) AS v(name, price);

-- STEAM FISH
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('STEAM FISH', '', 1299, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);

-- KILAWING BANGUS
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('KILAWING BANGUS', '', 1399, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1399),
  ('Party Tray (22-25 pax)', 2699)
) AS v(name, price);

-- FISH FILLET
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('FISH FILLET', '', 1299, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (22-25 pax)', 2499)
) AS v(name, price);


-- 10) VEGETABLES (Family & Party Trays)

-- CHOPSUEY OVERLOAD
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHOPSUEY OVERLOAD', '', 1299, 'family-trays-veggies', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (20-24 pax)', 2499)
) AS v(name, price);

-- VEGGIE SPRING ROLL
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('VEGGIE SPRING ROLL', '', 1299, 'family-trays-veggies', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (20-24 pax)', 2499)
) AS v(name, price);

-- BUTTER MIX VEGETABLE
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BUTTER MIX VEGETABLE', '', 1299, 'family-trays-veggies', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (20-24 pax)', 2499)
) AS v(name, price);

-- CREAMY MIX VEGGIE & EGG
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CREAMY MIX VEGGIE & EGG', '', 1299, 'family-trays-veggies', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (20-24 pax)', 2499)
) AS v(name, price);

-- STIR FRY MIX VEGGIE
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('STIR FRY MIX VEGGIE', '', 1299, 'family-trays-veggies', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (20-24 pax)', 2499)
) AS v(name, price);


-- 11) PASTA (Family & Party Trays)

-- LASAGNA ROLL
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('LASAGNA ROLL', '', 1499, 'family-trays-pasta', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1499),
  ('Party Tray (20-24 pax)', 2799)
) AS v(name, price);

-- BAKED SPAGHETTI
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BAKED SPAGHETTI', '', 1299, 'family-trays-pasta', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (20-24 pax)', 2499)
) AS v(name, price);

-- BAKED MACARONI
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BAKED MACARONI', '', 1299, 'family-trays-pasta', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (20-24 pax)', 2499)
) AS v(name, price);

-- MEATY PENNE CARBONARA
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('MEATY PENNE CARBONARA', '', 1299, 'family-trays-pasta', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1299),
  ('Party Tray (20-24 pax)', 2499)
) AS v(name, price);

-- CREAMY PRAWNS PARMESAN
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CREAMY PRAWNS PARMESAN', '', 1499, 'family-trays-pasta', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Trays (10-12 pax)', 1499),
  ('Party Tray (20-24 pax)', 2799)
) AS v(name, price);


-- 12) SAME DAY FAMILY & PARTY TRAYS

-- SHANGHAI ROLLS
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SHANGHAI ROLLS', '', 720, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 pax)', 720),
  ('Party Tray (18-20 pax)', 1350)
) AS v(name, price);

-- DYNAMITES
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('DYNAMITES', '', 780, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 pax)', 780),
  ('Party Tray (18-20 pax)', 1450)
) AS v(name, price);

-- CHICKEN CORDON BLEU
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHICKEN CORDON BLEU', '', 980, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 pax)', 980),
  ('Party Tray (18-20 pax)', 1680)
) AS v(name, price);

-- FRESH LUMPIANG UBOD
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('FRESH LUMPIANG UBOD', '', 900, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 pax)', 900),
  ('Party Tray (18-20 pax)', 1550)
) AS v(name, price);

-- SPECIAL CHOPSUEY
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SPECIAL CHOPSUEY', '', 720, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 pax)', 720),
  ('Party Tray (18-20 pax)', 1520)
) AS v(name, price);

-- CHOPSUEY CON LECHON
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('CHOPSUEY CON LECHON', '', 930, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 pax)', 930),
  ('Party Tray (18-20 pax)', 1750)
) AS v(name, price);

-- BINAGOONGAN BAGNET
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('BINAGOONGAN BAGNET', '', 980, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 pax)', 980),
  ('Party Tray (18-20 pax)', 1750)
) AS v(name, price);

-- PORK SISIG
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PORK SISIG', '', 980, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 pax)', 980),
  ('Party Tray (18-20 pax)', 1750)
) AS v(name, price);

-- TOKWA'T SISIG
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('TOKWA''T SISIG', '', 575, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 pax)', 575),
  ('Party Tray (18-20 pax)', 950)
) AS v(name, price);

-- TOKWA'T CON LECHON
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('TOKWA''T CON LECHON', '', 880, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 pax)', 880),
  ('Party Tray (18-20 pax)', 1530)
) AS v(name, price);

-- SIZZLING TOFU
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('SIZZLING TOFU', '', 675, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray (10-12 pax)', 675),
  ('Party Tray (18-20 pax)', 1050)
) AS v(name, price);


-- 13) PARTY PACKAGES (Same Day Order)

-- PACKAGE 1
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PACKAGE 1', '', 1650, 'party-packages', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('6 Pax Package', 1650)
) AS v(name, price);

-- PACKAGE 2
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PACKAGE 2', '', 2750, 'party-packages', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('10 Pax Package', 2750)
) AS v(name, price);


-- 14) PARTY TRAY PACKAGE (Advance Order Only - at least 5 Days Before)

-- FAMILY PACKAGE (FP-1)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('FAMILY PACKAGE (FP-1)', '', 6899, 'party-packages', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('6 Pax Package', 6899)
) AS v(name, price);

-- FAMILY PACKAGE (FP-2)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('FAMILY PACKAGE (FP-2)', '', 14599, 'party-packages', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('15 Pax Package', 14599)
) AS v(name, price);

-- PARTY PACKAGE (PP-1)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PARTY PACKAGE (PP-1)', '', 14599, 'party-packages', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('20-25 Pax Package', 14599)
) AS v(name, price);

