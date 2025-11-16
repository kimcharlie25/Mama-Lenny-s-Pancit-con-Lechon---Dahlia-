/*
  Add full Mama Lenny's menu.

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
  ('specialties-tub', 'Specialties (1,000 mL Tub)', '🥘', 31, true),
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

-- Bihon Guisado Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Bihon Guisado Con Lechon', '', 285, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 285),
  ('Bilao 1 (5-6 Pax)', 610),
  ('Bilao 2 (10-12 Pax)', 810),
  ('Bilao 3 (14-16 Pax)', 1150),
  ('Bilao 4 (18-20 Pax)', 1550)
) AS v(name, price);

-- Bihon Guisado Chicken
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Bihon Guisado Chicken', '', 199, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 199),
  ('Bilao 1 (5-6 Pax)', 475),
  ('Bilao 2 (10-12 Pax)', 685),
  ('Bilao 3 (14-16 Pax)', 995),
  ('Bilao 4 (18-20 Pax)', 1355)
) AS v(name, price);

-- Bihon Guisado Bagnet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Bihon Guisado Bagnet', '', 235, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 235),
  ('Bilao 1 (5-6 Pax)', 535),
  ('Bilao 2 (10-12 Pax)', 775),
  ('Bilao 3 (14-16 Pax)', 1100),
  ('Bilao 4 (18-20 Pax)', 1365)
) AS v(name, price);

-- Special Canton Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Special Canton Con Lechon', '', 320, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 320),
  ('Bilao 1 (5-6 Pax)', 695),
  ('Bilao 2 (10-12 Pax)', 965),
  ('Bilao 3 (14-16 Pax)', 1200),
  ('Bilao 4 (18-20 Pax)', 1665)
) AS v(name, price);

-- Special Canton Chicken
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Special Canton Chicken', '', 255, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 255),
  ('Bilao 1 (5-6 Pax)', 565),
  ('Bilao 2 (10-12 Pax)', 795),
  ('Bilao 3 (14-16 Pax)', 965),
  ('Bilao 4 (18-20 Pax)', 1255)
) AS v(name, price);

-- Special Canton Bagnet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Special Canton Bagnet', '', 295, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 295),
  ('Bilao 1 (5-6 Pax)', 645),
  ('Bilao 2 (10-12 Pax)', 935),
  ('Bilao 3 (14-16 Pax)', 1165),
  ('Bilao 4 (18-20 Pax)', 1465)
) AS v(name, price);

-- Bihon / Canton Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Bihon / Canton Con Lechon', '', 295, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 295),
  ('Bilao 1 (5-6 Pax)', 685),
  ('Bilao 2 (10-12 Pax)', 895),
  ('Bilao 3 (14-16 Pax)', 1350),
  ('Bilao 4 (18-20 Pax)', 1650)
) AS v(name, price);

-- Bihon / Canton Chicken
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Bihon / Canton Chicken', '', 225, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 225),
  ('Bilao 1 (5-6 Pax)', 575),
  ('Bilao 2 (10-12 Pax)', 795),
  ('Bilao 3 (14-16 Pax)', 935),
  ('Bilao 4 (18-20 Pax)', 1350)
) AS v(name, price);

-- Bihon / Canton Bagnet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Bihon / Canton Bagnet', '', 285, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 285),
  ('Bilao 1 (5-6 Pax)', 615),
  ('Bilao 2 (10-12 Pax)', 855),
  ('Bilao 3 (14-16 Pax)', 1150),
  ('Bilao 4 (18-20 Pax)', 1550)
) AS v(name, price);

-- Mikki / Bihon Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Mikki / Bihon Con Lechon', '', 325, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 325),
  ('Bilao 1 (5-6 Pax)', 685),
  ('Bilao 2 (10-12 Pax)', 875),
  ('Bilao 3 (14-16 Pax)', 1350),
  ('Bilao 4 (18-20 Pax)', 1650)
) AS v(name, price);

-- Mikki / Bihon Chicken
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Mikki / Bihon Chicken', '', 250, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 250),
  ('Bilao 1 (5-6 Pax)', 575),
  ('Bilao 2 (10-12 Pax)', 765),
  ('Bilao 3 (14-16 Pax)', 935),
  ('Bilao 4 (18-20 Pax)', 1350)
) AS v(name, price);

-- Mikki / Bihon Bagnet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Mikki / Bihon Bagnet', '', 285, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 285),
  ('Bilao 1 (5-6 Pax)', 635),
  ('Bilao 2 (10-12 Pax)', 835),
  ('Bilao 3 (14-16 Pax)', 1150),
  ('Bilao 4 (18-20 Pax)', 1550)
) AS v(name, price);

-- Special Palabok Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Special Palabok Con Lechon', '', 325, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 325),
  ('Bilao 1 (5-6 Pax)', 720),
  ('Bilao 2 (10-12 Pax)', 965),
  ('Bilao 3 (14-16 Pax)', 1350),
  ('Bilao 4 (18-20 Pax)', 1650)
) AS v(name, price);

-- Special Palabok Chicken
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Special Palabok Chicken', '', 285, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 285),
  ('Bilao 1 (5-6 Pax)', 655),
  ('Bilao 2 (10-12 Pax)', 895),
  ('Bilao 3 (14-16 Pax)', 1200),
  ('Bilao 4 (18-20 Pax)', 1550)
) AS v(name, price);

-- Japchae Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Japchae Con Lechon', '', 365, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 365),
  ('Bilao 1 (5-6 Pax)', 655),
  ('Bilao 2 (10-12 Pax)', 935),
  ('Bilao 3 (14-16 Pax)', 1465),
  ('Bilao 4 (18-20 Pax)', 1835)
) AS v(name, price);

-- Japchae Chicken
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Japchae Chicken', '', 325, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 325),
  ('Bilao 1 (5-6 Pax)', 585),
  ('Bilao 2 (10-12 Pax)', 835),
  ('Bilao 3 (14-16 Pax)', 1295),
  ('Bilao 4 (18-20 Pax)', 1495)
) AS v(name, price);

-- Pancit Puti
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Pancit Puti', '', 195, 'pancit-toppings', false, true)
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

-- Special Lomi Con Lechon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Special Lomi Con Lechon', '', 195, 'pancit-toppings', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('1L Tub (2-3 Pax)', 195),
  ('Bilao 1 (5-6 Pax)', 265)
) AS v(name, price);


-- 3) FAMILY & PARTY TRAYS (BEEF)

-- Beef Morcon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Beef Morcon (Boiled with stuffing)', '', 1499, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1499),
  ('Party Tray 22-25 Pax', 2799)
) AS v(name, price);

-- Beef Mechado
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Beef Mechado (Chunks in savory tomato sauce)', '', 1399, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1399),
  ('Party Tray 22-25 Pax', 2699)
) AS v(name, price);

-- Beef Caldereta
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Beef Caldereta (With vegetables in special tomato sauce)', '', 1399, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1399),
  ('Party Tray 22-25 Pax', 2699)
) AS v(name, price);

-- Lengua Estofado
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Lengua Estofado (Beef Tongue)', '', 1499, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1499),
  ('Party Tray 22-25 Pax', 2799)
) AS v(name, price);

-- Beef Mushroom
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Beef Mushroom', '', 1399, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1399),
  ('Party Tray 22-25 Pax', 2699)
) AS v(name, price);

-- Beef Kare-Kare
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Beef Kare-Kare (Beef and set trio)', '', 1499, 'family-trays-beef', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1499),
  ('Party Tray 22-25 Pax', 2799)
) AS v(name, price);


-- 4) FAMILY & PARTY TRAYS (PORK)

-- Baby Back Ribs
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Baby Back Ribs (Tender pork ribs in smoky BBQ sauce)', '', 1399, 'family-trays-pork', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1399),
  ('Party Tray 22-25 Pax', 2799)
) AS v(name, price);

-- Special Menudo
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Special Menudo (Liver, pickles, sausage, and vegetables)', '', 1299, 'family-trays-pork', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);

-- Embotido
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Embotido (Meat roll with pork and stuffing)', '', 1299, 'family-trays-pork', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);

-- Bopis
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Bopis (Spicy savory pork lungs & heart)', '', 1299, 'family-trays-pork', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);

-- Pork Hamonado
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Pork Hamonado (Boiled pork loin with syrup)', '', 1299, 'family-trays-pork', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);


-- 5) FAMILY & PARTY TRAYS (CHICKEN)

-- Chicken Teriyaki
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Chicken Teriyaki (Glazed in sweet savory pineapple)', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);

-- Honey Lemon
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Honey Lemon (Sweet honey lemon glaze)', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);

-- Chicken Lollipop
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Chicken Lollipop (Drumlets and wings)', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);

-- Chicken Pickles
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Chicken Pickles (Tangy chicken with pickles, pineapple, and vegetables)', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);

-- Chicken Pastel
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Chicken Pastel (Chunks, mushrooms, and sausages)', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);

-- Chicken Fillet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Chicken Fillet (Boiled with stuffing)', '', 1299, 'family-trays-chicken', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);


-- 6) FAMILY & PARTY TRAYS (SEAFOOD)

-- Creamy Garlic Prawns
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Creamy Garlic Prawns (Boiled with stuffing)', '', 1499, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1499),
  ('Party Tray 22-25 Pax', 2799)
) AS v(name, price);

-- Buttered Garlic Shrimp
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Buttered Garlic Shrimp (Boiled in shrimp broth)', '', 1499, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1499),
  ('Party Tray 22-25 Pax', 2799)
) AS v(name, price);

-- Shrimp in Olive Sauce
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Shrimp in Olive Sauce (Shrimp, olives, tomatoes, and onion)', '', 1499, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1499),
  ('Party Tray 22-25 Pax', 2799)
) AS v(name, price);

-- Steamed Fish
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Steamed Fish (Steamed with sour soy)', '', 1299, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);

-- Kilawing Bangus
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Kilawing Bangus (With vinegar and spices)', '', 1399, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1399),
  ('Party Tray 22-25 Pax', 2699)
) AS v(name, price);

-- Creamy Sipo Shrimp & Egg
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Creamy Sipo Shrimp & Egg', '', 1499, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1499),
  ('Party Tray 22-25 Pax', 2799)
) AS v(name, price);

-- Fish Fillet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Fish Fillet (Tender, creamy fish fillet with tartar sauce)', '', 1299, 'family-trays-seafood', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 22-25 Pax', 2499)
) AS v(name, price);


-- 7) FAMILY & PARTY TRAYS (VEGETABLES)

-- Chopsuey Overload
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Chopsuey Overload (Cabbage, broccoli, corn, quail eggs, chicken, liver)', '', 1299, 'family-trays-veggies', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 20-24 Pax', 2499)
) AS v(name, price);

-- Veggie Spring Roll
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Veggie Spring Roll (Fried vegetable spring roll with crab sauce)', '', 1299, 'family-trays-veggies', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 20-24 Pax', 2499)
) AS v(name, price);

-- Butterfly Mix Vegetable
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Butterfly Mix Vegetable (Carrots, corn, green beans)', '', 1299, 'family-trays-veggies', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 20-24 Pax', 2499)
) AS v(name, price);

-- Creamy Mix Veggie & Egg
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Creamy Mix Veggie & Egg (Creamy mixed vegetables with egg & cream)', '', 1299, 'family-trays-veggies', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 20-24 Pax', 2499)
) AS v(name, price);

-- Stir Fry Mix Veggie
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Stir Fry Mix Veggie (Broccoli, corn, chicharo, mushroom, bell pepper)', '', 1299, 'family-trays-veggies', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 20-24 Pax', 2499)
) AS v(name, price);


-- 8) FAMILY & PARTY TRAYS (PASTA)

-- Lasagna Roll
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Lasagna Roll (Meaty sauce & cheese sauce)', '', 1499, 'family-trays-pasta', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1499),
  ('Party Tray 20-24 Pax', 2799)
) AS v(name, price);

-- Baked Spaghetti
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Baked Spaghetti (Meaty spaghetti with baked cheese)', '', 1299, 'family-trays-pasta', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 20-24 Pax', 2499)
) AS v(name, price);

-- Baked Macaroni
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Baked Macaroni (Meaty pasta with creamy cheese sauce)', '', 1299, 'family-trays-pasta', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 20-24 Pax', 2499)
) AS v(name, price);

-- Meaty Penne Carbonara
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Meaty Penne Carbonara (Creamy white & meaty sauce)', '', 1299, 'family-trays-pasta', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1299),
  ('Party Tray 20-24 Pax', 2499)
) AS v(name, price);

-- Creamy Prawns Parmesan
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Creamy Prawns Parmesan (Boiled size with stuffing)', '', 1499, 'family-trays-pasta', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 1499),
  ('Party Tray 20-24 Pax', 2799)
) AS v(name, price);


-- 9) SPECIALTIES (Trays - Same Day Order)

-- Shanghai Rolls (10 Pieces)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Shanghai Rolls (10 Pieces)', '', 720, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 720),
  ('Party Tray 18-20 Pax', 1350)
) AS v(name, price);

-- Dynamites
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Dynamites', '', 780, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 780),
  ('Party Tray 18-20 Pax', 1450)
) AS v(name, price);

-- Chicken Cordon Bleu
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Chicken Cordon Bleu', '', 980, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 980),
  ('Party Tray 18-20 Pax', 1680)
) AS v(name, price);

-- Fresh Lumpiang Ubod
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Fresh Lumpiang Ubod', '', 900, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 900),
  ('Party Tray 18-20 Pax', 1550)
) AS v(name, price);

-- Special Chopsuey (Trays)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Special Chopsuey (Trays)', '', 720, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 720),
  ('Party Tray 18-20 Pax', 1520)
) AS v(name, price);

-- Chopsuey Con Lechon (Trays)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Chopsuey Con Lechon (Trays)', '', 930, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 930),
  ('Party Tray 18-20 Pax', 1750)
) AS v(name, price);

-- Binagoongan Bagnet (Trays)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Binagoongan Bagnet (Trays)', '', 980, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 980),
  ('Party Tray 18-20 Pax', 1750)
) AS v(name, price);

-- Pork Sisig (Trays)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Pork Sisig (Trays)', '', 980, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 980),
  ('Party Tray 18-20 Pax', 1750)
) AS v(name, price);

-- Tokwa Sisig (Trays)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Tokwa Sisig (Trays)', '', 575, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 575),
  ('Party Tray 18-20 Pax', 950)
) AS v(name, price);

-- Tokwa''t Con Lechon (Trays)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Tokwa''t Con Lechon (Trays)', '', 880, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 880),
  ('Party Tray 18-20 Pax', 1530)
) AS v(name, price);

-- Sizzling Tofu (Trays)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Sizzling Tofu (Trays)', '', 675, 'specialties-trays', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('Family Tray 10-12 Pax', 675),
  ('Party Tray 18-20 Pax', 1050)
) AS v(name, price);


-- 10) SPECIALTIES (1,000 mL Tub)

-- Crispy Ulo
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Crispy Ulo', '', 999, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 999)) AS v(name, price);

-- Crispy Pata Super Jumbo
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Crispy Pata Super Jumbo', '', 799, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 799)) AS v(name, price);

-- Binagoongan Bagnet (Tub)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Binagoongan Bagnet (Tub)', '', 799, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 799)) AS v(name, price);

-- Crispy Bagnet
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Crispy Bagnet', '', 399, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 399)) AS v(name, price);

-- Rosemary Chicken (Tub)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Rosemary Chicken (Tub)', '', 549, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 549)) AS v(name, price);

-- Pork Sisig (Tub)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Pork Sisig (Tub)', '', 270, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 270)) AS v(name, price);

-- Chicharon Bulaklak
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Chicharon Bulaklak', '', 235, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 235)) AS v(name, price);

-- Cordon Bleu (Tub)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Cordon Bleu (Tub)', '', 420, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 420)) AS v(name, price);

-- Special Chopsuey (Tub)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Special Chopsuey (Tub)', '', 399, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 399)) AS v(name, price);

-- Chopsuey Con Lechon (Tub)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Chopsuey Con Lechon (Tub)', '', 330, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 330)) AS v(name, price);

-- Shanghai Rolls (10 Pieces) Tub
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Shanghai Rolls (10 Pieces, Tub)', '', 240, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub, 10 Pieces', 240)) AS v(name, price);

-- Dynamite (Tub)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Dynamite (Tub)', '', 240, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 240)) AS v(name, price);

-- Crispy Tawilis
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Crispy Tawilis', '', 220, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 220)) AS v(name, price);

-- Tokwa Sisig (Tub)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Tokwa Sisig (Tub)', '', 149, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 149)) AS v(name, price);

-- Tofu Sweet and Sour
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Tofu Sweet and Sour', '', 1255, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 1255)) AS v(name, price);

-- Sizzling Tofu (Tub)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Sizzling Tofu (Tub)', '', 159, 'specialties-tub', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('1,000 mL Tub', 159)) AS v(name, price);


-- 11) SNACKS

-- Fresh Lumpia
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Fresh Lumpia', '', 89, 'snacks', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('Solo', 89)) AS v(name, price);

-- Cheese Sticks
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Cheese Sticks', '', 89, 'snacks', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('Solo', 89)) AS v(name, price);

-- Palabok (Snack)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Palabok (Snack)', '', 129, 'snacks', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('Solo', 129)) AS v(name, price);

-- Chicken Mami
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Chicken Mami', '', 129, 'snacks', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('Solo', 129)) AS v(name, price);

-- Buttered Puto Box
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Buttered Puto Box', '', 180, 'snacks', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('Box', 180)) AS v(name, price);


-- 12) DESSERTS

-- Buttered Puto
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Buttered Puto', '', 15, 'desserts', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('Per Piece', 15)) AS v(name, price);

-- Puto Cake 12"
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Puto Cake 12"', '', 420, 'desserts', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('12" Made to Order', 420)) AS v(name, price);

-- Sapin-Sapin 12"
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Sapin-Sapin 12"', '', 650, 'desserts', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('12" Made to Order', 650)) AS v(name, price);

-- Sapin-Sapin Solo
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Sapin-Sapin Solo', '', 130, 'desserts', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('Solo', 130)) AS v(name, price);

-- Turon de Sapin-Sapin
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('Turon de Sapin-Sapin', '', 75, 'desserts', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES
  ('3 pcs', 75),
  ('6 pcs', 150),
  ('10 pcs', 230)
) AS v(name, price);


-- 13) PARTY PACKAGES

-- Package 1 (6 Pax)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PACKAGE 1 (6 Pax)', '', 1650, 'party-packages', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('6 Pax Package', 1650)) AS v(name, price);

-- Package 2 (10 Pax)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PACKAGE 2 (10 Pax)', '', 2750, 'party-packages', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('10 Pax Package', 2750)) AS v(name, price);

-- Family Package (15 Pax)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('FAMILY PACKAGE (15 Pax)', '', 6899, 'party-packages', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('15 Pax Package', 6899)) AS v(name, price);

-- Party Package (20-25 Pax)
WITH item AS (
  INSERT INTO public.menu_items (name, description, base_price, category, popular, available)
  VALUES ('PARTY PACKAGE (20-25 Pax)', '', 14599, 'party-packages', false, true)
  RETURNING id
)
INSERT INTO public.variations (menu_item_id, name, price)
SELECT item.id, v.name, v.price
FROM item,
LATERAL (VALUES ('20-25 Pax Package', 14599)) AS v(name, price);


