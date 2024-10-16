# frozen_string_literal: true

FieldTemplate.seed_field_templates_from_yaml('db/seeds/fields/field_templates.yml')

# # db/seeds.rb
# if FieldTemplate.all.blank?
#   FieldTemplate.create([
#                          { name: 'build', dropdown: true, description: '{{possessive}} build/body type', multiple: false, type: 'string' },
#                          { name: 'cock girth', dropdown: true, description: 'how thick around {{possessive}} cock is; its circumference, `in inches', multiple: false, type: 'float' },
#                          { name: 'cock length', dropdown: true, description: 'how long {{possessive}} cock is, measured from the base along the top, in inches', multiple: false, type: 'float' },
#                          { name: 'dominance', dropdown: true, description: 'how "dominant" {{be}} {{subject}} in the sack (or dungeon)?', multiple: false, type: 'integer' },
#                          { name: 'drinker', dropdown: true, description: '{{possessive}} habits with alcohol', multiple: false, type: 'string' },
#                          { name: 'drug use', dropdown: true, description: '{{possessive}} habits as they relate to recreational drug usage', multiple: false, type: 'string' },
#                          { name: 'drugs of choice', dropdown: false, description: 'when/if {{subject}} {{verb:use}} recreational drugs, which one(s) {{do}} {{subject}} use?', multiple: true, type: 'string' },
#                          { name: 'eye color', dropdown: false, description: 'what color are {{possessive}} eyes? (note: if you have heterochromia, you can select more tha one)', multiple: true, type: 'string' },
#                          { name: 'hair color', dropdown: true, description: 'what color is {{possessive}} hair?', multiple: false, type: 'string' },
#                          { name: 'hair length/style', dropdown: true, description: '{{possessive}} hair length/style', multiple: false, type: 'string' },
#                          { name: 'hiv status', dropdown: true, description: '{{possessive}} HIV status', multiple: false, type: 'string' },
#                          { name: 'kinks/fetishes', dropdown: false, description: 'the fuck {{be}} {{subject}} into, BBro?', multiple: true, type: 'string' },
#                          { name: 'location', dropdown: false, description: '{{possessive}} current location (city, state)', multiple: false, type: 'object' },
#                          { name: 'race', dropdown: true, description: '{{possessive}} racial makeup', multiple: true, type: 'string' },
#                          { name: 'sexual role', dropdown: true, description: '{{do}} {{subject}} prefer the top or the bottom bunk?', multiple: fals, type: 'string' },
#                          { name: 'smoker', dropdown: true, description: '{{do}} {{subject}} use cigarettes?', multiple: false, type: 'string' },
#                          { name: 'body hair', dropdown: true, description: 'how hairy {{be}} {{subject}}?', multiple: false, type: 'string' },
#                          { name: 'height', dropdown: true, description: 'how tall {{be}} {{subject}}?', multiple: false, type: 'float' },
#                          { name: 'weight', dropdown: true, description: 'how much {{do}} {{subject}} weigh?', multiple: false, type: 'float' },
#                        ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'location').id).blank?
#   FieldTemplate.find_or_create_by(name: 'location').field_values.create([{ display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t entered {{possessive}} location (yet)',
#                                                                            default: true, order: 0 }])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'hiv status').id).blank?
#   FieldTemplate.find_or_create_by(name: 'hiv status').field_values.create([
#                                                                             { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t entered a value for {{possessive}} HIV status', default: true, order: 0 },
#                                                                             { display_value: '???', value: 'unknown', description: '{{possessive}} HIV status is unknown', order: 1 },
#                                                                             { display_value: 'neg (chasing)', value: 'chaser', description: '{{subject}} {{be}} HIV-negative and {{be}} actively chasing HIV', order: 2 },
#                                                                             { display_value: 'neg (on PrEP)', value: 'prep', description: '{{subject}} {{be}} HIV-negative and on pre-exposure prophylaxis', order: 3 },
#                                                                             { display_value: 'neg', value: 'neg', description: '{{subject}} {{be}} HIV-negative', order: 4 },
#                                                                             { display_value: 'poz (undetectable)', value: 'tasp', description: '{{subject}} {{be}} HIV-positive, on medication, and {{have}} an undetectable viral load', order: 5 },
#                                                                             { display_value: 'poz (toxic)', value: 'toxic', description: '{{subject}} {{be}} HIV-positive, not on medication. and {{have}} a "toxic" viral load', order: 6 },
#                                                                             { display_value: 'poz', value: 'poz', description: '{{subject}} {{be}} HIV-positive', order: 7 },
#                                                                             { display_value: 'other', value: 'other', description: '{{subject}} {{be}} some other status not otherwise listed', order: 8 },
#                                                                           ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'sexual role').id).blank?
#   FieldTemplate.find_or_create_by(name: 'sexual role').field_values.create([
#                                                                              { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected a sexual role (yet)', default: true, order: 0 },
#                                                                              { display_value: 'total bottom', value: 'total-bottom',
#                                                                                description: '{{subject}} never {{verb:put}} {{possessive}} dick in another man\'s ass; {{possessive}} dick is only for show or to flop around whilst {{subject}} {{verb:get}} railed', order: 1 },
#                                                                              { display_value: 'bottom', value: 'bottom', description: '{{subject}} {{be}} a bottom, but {{subject}} can top in an emergency', order: 2 },
#                                                                              { display_value: 'mostly bottom', value: 'mostly-btm', description: '{{subject}}\'ll top for the right guy', order: 3 },
#                                                                              { display_value: 'vers bottom', value: 'vers-btm', description: '{{subject}} {{be}} predominantly bottom, but will top on occasion', order: 4 },
#                                                                              { display_value: 'versatile', value: 'vers', description: '{{subject}} {{verb:enjoy}} both fucking and getting fucked equally', order: 5 },
#                                                                              { display_value: 'vers top', value: 'vers-top', description: '{{subject}} {{be}} predominantly a top, but {{verb:enjoy}} bottoming on occasion', order: 6 },
#                                                                              { display_value: 'mostly top', value: 'mostly-top', description: '{{subject}}\'ll bottom for the right guy', order: 7 },
#                                                                              { display_value: 'top', value: 'top', description: '{{subject}} will bottom on very rare occasions', order: 8 },
#                                                                              { display_value: 'total top', value: 'total-top', description: '{{subject}} {{be}} a total top; no dick goes in {{possessive}} ass EVER', order: 9 },
#                                                                            ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'hair length/style').id).blank?
#   FieldTemplate.find_or_create_by(name: 'hair length/style').field_values.create([
#                                                                                    { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected a hair style (yet)', default: true, order: 0 },
#                                                                                    { display_value: 'short', value: 'short', description: '{{subject}} {{verb:wear}} {{possessive}} hair short', order: 1 },
#                                                                                    { display_value: 'military', value: 'military', description: '{{subject}} {{verb:wear}} {{possessive}} hair in military-style or crew cut', order: 2 },
#                                                                                    { display_value: 'bald', value: 'bald', description: '{{possessive}} head id bald/shaved', order: 3 },
#                                                                                    { display_value: 'medium', value: 'medium', description: '{{subject}} {{verb:wear}} {{possessive}} hair at a medium length', order: 4 },
#                                                                                    { display_value: 'long', value: 'like-a-chicks', description: '{{subject}} {{have}} long hair, like a chick\'s', order: 5 },
#                                                                                  ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'hair color').id).blank?
#   FieldTemplate.find_or_create_by(name: 'hair color').field_values.create([
#                                                                             { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected a hair color (yet)', default: true, order: 0 },
#                                                                             { display_value: 'light blond', value: 'lbl', description: 'light blond', order: 1 },
#                                                                             { display_value: 'blond', value: 'bln', description: 'blond', order: 2 },
#                                                                             { display_value: 'dark blond', value: 'dbl', description: 'dark blond', order: 3 },
#                                                                             { display_value: 'light brown', value: 'lbr', description: 'light brown', order: 4 },
#                                                                             { display_value: 'brown', value: 'brn', description: 'brown', order: 5 },
#                                                                             { display_value: 'dark brown', value: 'dbr', description: 'dark brown', order: 6 },
#                                                                             { display_value: 'red', value: 'red', description: 'auburn/red', order: 7 },
#                                                                             { display_value: 'black', value: 'blk', description: 'black', order: 8 },
#                                                                             { display_value: 'gray', value: 'gry', description: 'gray', order: 9 },
#                                                                             { display_value: 'bald', value: 'bld', description: 'bald', order: 10 },
#                                                                             { display_value: 'dyed', value: 'dye', description: 'dyed', order: 11 },
#                                                                             { display_value: 'other', value: 'oth', description: 'some other color', order: 12 },
#                                                                           ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'eye color').id).blank?
#   FieldTemplate.find_or_create_by(name: 'eye color').field_values.create([
#                                                                            { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected an eye color (yet)', default: true, order: 0 },
#                                                                            { display_value: 'brown', value: 'brown', description: '{{subject}} {{have}} brown eyes', order: 1 },
#                                                                            { display_value: 'blue', value: 'blue', description: '{{subject}} {{have}} blue eyes', order: 2 },
#                                                                            { display_value: 'hazel', value: 'hazel', description: '{{subject}} {{have}} hazel eyes', order: 3 },
#                                                                            { display_value: 'black', value: 'black', description: '{{subject}} {{have}} black eyes', order: 4 },
#                                                                            { display_value: 'green', value: 'green', description: '{{subject}} {{have}} green eyes', order: 5 },
#                                                                            { display_value: 'gray', value: 'gray', description: '{{subject}} {{have}} gray eyes', order: 6 },
#                                                                          ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'build').id).blank?
#   FieldTemplate.find_or_create_by(name: 'build').field_values.create([
#                                                                        { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected a build (yet)', default: true, order: 0 },
#                                                                        { display_value: 'skinny', value: 'skinny', description: '{{subject}} {{have}} a skinny/slim build', order: 1 },
#                                                                        { display_value: 'athletic', value: 'athletic', description: '{{subject}} {{have}} an athletic build', order: 2 },
#                                                                        { display_value: 'average', value: 'average', description: '{{subject}} {{have}} an average build', order: 3 },
#                                                                        { display_value: 'muscular', value: 'muscular', description: '{{subject}} {{have}} a muscular build', order: 4 },
#                                                                        { display_value: 'heavy-set', value: 'fat', description: '{{subject}} {{have}} a heavy-set (i.e., fat) build', order: 5 },
#                                                                        { display_value: 'twink', value: 'twink', description: '{{subject}} {{have}} a skinny smooth twinkish build', order: 6 },
#                                                                        { display_value: 'swimmers', value: 'swimmers', description: '{{subject}} {{have}} a skinny athletic swimmers build', order: 7 },
#                                                                        { display_value: 'chub', value: 'chub', description: '{{subject}} {{have}} a chubby (i.e., fat) build', order: 8 },
#                                                                        { display_value: 'bear', value: 'bear', description: '{{subject}} {{have}} a bearish build', order: 9 },
#                                                                        { display_value: 'otter', value: 'otter', description: '{{subject}} {{have}} an otterish (slim and hairy) build', order: 10 },
#                                                                      ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'race').id).blank?
#   FieldTemplate.find_or_create_by(name: 'race').field_values.create([
#                                                                       { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected a race (yet)', default: true, order: 0 },
#                                                                       { display_value: 'white', value: 'white', description: '{{possessive}} origins are in the original peoples of Europe', order: 1 },
#                                                                       { display_value: 'black', value: 'nigger', description: '{{possessive}} ancestry is from any of the black racial groups of Africa', order: 2 },
#                                                                       { display_value: 'asian', value: 'rice-nigger', description: '{{possessive}} ancestry is generally Asian (e.g, Chinese, Korean, Japanese, Mongolian)', order: 3 },
#                                                                       { display_value: 'hispanic', value: 'beaner', description: '{{possessive}} ancestry is generally from Latin America or Spain', order: 4 },
#                                                                       { display_value: 'american indian / alaskan native', value: 'redskin', description: '{{possessive}} ancestry is ultimately Asian but {{possessive}} ancestors came to the United States before Columbus', order: 5 },
#                                                                       { display_value: 'indian', value: 'curry-nigger', description: '{{possessive}} ancestry is generally from the Indian subcontinent', order: 6 },
#                                                                       { display_value: 'middle eastern', value: 'sand-nigger', description: '{{possessive}} origins are in the Middle East', order: 7 },
#                                                                       { display_value: 'native hawaiian/pacific islander', value: 'dontskimpontherum',
#                                                                         description: '{{subject}} {{has}} origins in any of the original peoples of Hawaii, Guam, Samoa, or other Pacific Islands (and don\t skimp on the rum!)', order: 8 },
#                                                                       { display_value: 'other', value: 'other', description: 'Some other racial makeup', order: 9 },
#                                                                     ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'cock length').id).blank?
#   FieldTemplate.find_or_create_by(name: 'cock length').field_values.create([
#                                                                              { value: nil, display_value: '[not entered]', description: '{{subject}} {{have}}n\'t selected a cock length (yet)', default: true, order: 0 },
#                                                                              { value: 0.5, display_value: '½"', description: '{{possessive}} cock measures ½ inches', order: 1 },
#                                                                              { value: 1, display_value: '1"', description: '{{possessive}} cock measures 1 inches', order: 2 },
#                                                                              { value: 1.5, display_value: '1 ½"', description: '{{possessive}} cock measures 1 ½ inches', order: 3 },
#                                                                              { value: 2, display_value: '2"', description: '{{possessive}} cock measures 2 inches', order: 4 },
#                                                                              { value: 2.5, display_value: '2 ½"', description: '{{possessive}} cock measures 2 ½ inches', order: 5 },
#                                                                              { value: 3, display_value: '3"', description: '{{possessive}} cock measures 3 inches', order: 6 },
#                                                                              { value: 3.5, display_value: '3 ½"', description: '{{possessive}} cock measures 3 ½ inches', order: 7 },
#                                                                              { value: 4, display_value: '4"', description: '{{possessive}} cock measures 4 inches', order: 8 },
#                                                                              { value: 4.5, display_value: '4 ½"', description: '{{possessive}} cock measures 4 ½ inches', order: 9 },
#                                                                              { value: 5, display_value: '5"', description: '{{possessive}} cock measures 5 inches', order: 10 },
#                                                                              { value: 5.5, display_value: '5 ½"', description: '{{possessive}} cock measures 5 ½ inches', order: 11 },
#                                                                              { value: 6, display_value: '6"', description: '{{possessive}} cock measures 6 inches', order: 12 },
#                                                                              { value: 6.5, display_value: '6 ½"', description: '{{possessive}} cock measures 6 ½ inches', order: 13 },
#                                                                              { value: 7, display_value: '7"', description: '{{possessive}} cock measures 7 inches', order: 14 },
#                                                                              { value: 7.5, display_value: '7 ½"', description: '{{possessive}} cock measures 7 ½ inches', order: 15 },
#                                                                              { value: 8, display_value: '8"', description: '{{possessive}} cock measures 8 inches', order: 16 },
#                                                                              { value: 8.5, display_value: '8 ½"', description: '{{possessive}} cock measures 8 ½ inches', order: 17 },
#                                                                              { value: 9, display_value: '9"', description: '{{possessive}} cock measures 9 inches', order: 18 },
#                                                                              { value: 9.5, display_value: '9 ½"', description: '{{possessive}} cock measures 9 ½ inches', order: 19 },
#                                                                              { value: 10, display_value: '10"', description: '{{possessive}} cock measures 10 inches', order: 20 },
#                                                                              { value: 10.5, display_value: '10 ½"', description: '{{possessive}} cock measures 10 ½ inches', order: 21 },
#                                                                              { value: 11, display_value: '11"', description: '{{possessive}} cock measures 11 inches', order: 22 },
#                                                                              { value: 11.5, display_value: '11 ½"', description: '{{possessive}} cock measures 11 ½ inches', order: 23 },
#                                                                              { value: 12, display_value: '12"', description: '{{possessive}} cock measures 12 inches', order: 24 },
#                                                                              { value: 12.5, display_value: '12 ½"', description: '{{possessive}} cock measures 12 ½ inches', order: 25 },
#                                                                              { value: 9999, display_value: '> 12 ½"', description: '{{possessive}} cock measures greater than 12 ½ inches!!', order: 26 },
#                                                                            ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'cock girth').id).blank?
#   FieldTemplate.find_or_create_by(name: 'cock girth').field_values.create([
#                                                                             { value: nil, description: '{{subject}} {{have}}n\'t selected a cock girth (yet)', default: true, order: 0 },
#                                                                             { value: 0.5, display_value: '½"', description: '{{possessive}} cock measures ½ inches in girth (circumference)', order: 1 },
#                                                                             { value: 0.75, display_value: '¾"', description: '{{possessive}} cock measures ¾ inches in girth (circumference)', order: 2 },
#                                                                             { value: 1, display_value: '1"', description: '{{possessive}} cock measures 1 inches in girth (circumference)', order: 3 },
#                                                                             { value: 1.25, display_value: '1 ¼"', description: '{{possessive}} cock measures 1 ¼ inches in girth (circumference)', order: 4 },
#                                                                             { value: 1.5, display_value: '1 ½"', description: '{{possessive}} cock measures 1 ½ inches in girth (circumference)', order: 5 },
#                                                                             { value: 2.75, display_value: '2 ¾"', description: '{{possessive}} cock measures 2 ¾ inches in girth (circumference)', order: 6 },
#                                                                             { value: 2, display_value: '2"', description: '{{possessive}} cock measures 2 inches in girth (circumference)', order: 7 },
#                                                                             { value: 2.25, display_value: '2 ¼"', description: '{{possessive}} cock measures 2 ¼ inches in girth (circumference)', order: 8 },
#                                                                             { value: 2.5, display_value: '2 ½"', description: '{{possessive}} cock measures 2 ½ inches in girth (circumference)', order: 9 },
#                                                                             { value: 2.75, display_value: '2 ¾"', description: '{{possessive}} cock measures 2 ¾ inches in girth (circumference)', order: 10 },
#                                                                             { value: 3, display_value: '3"', description: '{{possessive}} cock measures 3 inches in girth (circumference)', order: 11 },
#                                                                             { value: 3.25, display_value: '3 ¼"', description: '{{possessive}} cock measures 3 ¼ inches in girth (circumference)', order: 12 },
#                                                                             { value: 3.5, display_value: '3 ½"', description: '{{possessive}} cock measures 3 ½ inches in girth (circumference)', order: 13 },
#                                                                             { value: 3.75, display_value: '3 ¾"', description: '{{possessive}} cock measures 3 ¾ inches in girth (circumference)', order: 14 },
#                                                                             { value: 4, display_value: '4"', description: '{{possessive}} cock measures 4 inches in girth (circumference)', order: 15 },
#                                                                             { value: 4.25, display_value: '4 ¼"', description: '{{possessive}} cock measures 4 ¼ inches in girth (circumference)', order: 16 },
#                                                                             { value: 4.5, display_value: '4 ½"', description: '{{possessive}} cock measures 4 ½ inches in girth (circumference)', order: 17 },
#                                                                             { value: 4.75, display_value: '4 ¾"', description: '{{possessive}} cock measures 4 ¾ inches in girth (circumference)', order: 18 },
#                                                                             { value: 5, display_value: '5"', description: '{{possessive}} cock measures 5 inches in girth (circumference)', order: 19 },
#                                                                             { value: 5.25, display_value: '5 ¼"', description: '{{possessive}} cock measures 5 ¼ inches in girth (circumference)', order: 20 },
#                                                                             { value: 5.5, display_value: '5 ½"', description: '{{possessive}} cock measures 5 ½ inches in girth (circumference)', order: 21 },
#                                                                             { value: 5.75, display_value: '5 ¾"', description: '{{possessive}} cock measures 5 ¾ inches in girth (circumference)', order: 22 },
#                                                                             { value: 6, display_value: '6"', description: '{{possessive}} cock measures 6 inches in girth (circumference)', order: 23 },
#                                                                             { value: 6.25, display_value: '6 ¼"', description: '{{possessive}} cock measures 6 ¼ inches in girth (circumference)', order: 24 },
#                                                                             { value: 6.5, display_value: '6 ½"', description: '{{possessive}} cock measures 6 ½ inches in girth (circumference)', order: 25 },
#                                                                             { value: 6.75, display_value: '6 ¾"', description: '{{possessive}} cock measures 6 ¾ inches in girth (circumference)', order: 26 },
#                                                                             { value: 7, display_value: '7"', description: '{{possessive}} cock measures 7 inches in girth (circumference)', order: 27 },
#                                                                             { value: 7.25, display_value: '7 ¼"', description: '{{possessive}} cock measures 7 ¼ inches in girth (circumference)', order: 28 },
#                                                                             { value: 7.5, display_value: '7 ½"', description: '{{possessive}} cock measures 7 ½ inches in girth (circumference)', order: 29 },
#                                                                             { value: 7.75, display_value: '7 ¾"', description: '{{possessive}} cock measures 7 ¾ inches in girth (circumference)', order: 30 },
#                                                                             { value: 8, display_value: '8"', description: '{{possessive}} cock measures 8 inches in girth (circumference)', order: 31 },
#                                                                             { value: 8.25, display_value: '8 ¼"', description: '{{possessive}} cock measures 8 ¼ inches in girth (circumference)', order: 32 },
#                                                                             { value: 8.5, display_value: '8 ½"', description: '{{possessive}} cock measures 8 ½ inches in girth (circumference)', order: 33 },
#                                                                             { value: 8.75, display_value: '8 ¾"', description: '{{possessive}} cock measures 8 ¾ inches in girth (circumference)', order: 34 },
#                                                                             { value: 9, display_value: '9"', description: '{{possessive}} cock measures 9 inches in girth (circumference)', order: 35 },
#                                                                             { value: 9.25, display_value: '9 ¼"', description: '{{possessive}} cock measures 9 ¼ inches in girth (circumference)', order: 36 },
#                                                                             { value: 9.5, display_value: '9 ½"', description: '{{possessive}} cock measures 9 ½ inches in girth (circumference)', order: 37 },
#                                                                             { value: 9.75, display_value: '9 ¾"', description: '{{possessive}} cock measures 9 ¾ inches in girth (circumference)', order: 38 },
#                                                                             { value: 10, display_value: '10"', description: '{{possessive}} cock measures 10 inches in girth (circumference)', order: 39 },
#                                                                             { value: 9999, display_value: '> 10"', description: '{{possessive}} cock measures > 10 inches in girth (circumference)', order: 40 },
#                                                                           ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'smoker').id).blank?
#   FieldTemplate.find_or_create_by(name: 'smoker').field_values.create([
#                                                                         { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected whether {{subject}} {{verb:smoke}}s (yet)', default: true, order: 0 },
#                                                                         { display_value: 'yes, heavily', value: 'heavily', description: '{{subject}} {{verb:smoke}} a lot', order: 1 },
#                                                                         { display_value: 'yes', value: 'yes', description: '{{subject}} {{verb:smoke}}', order: 2 },
#                                                                         { display_value: 'socially', value: 'socially', description: '{{subject}} {{verb:smoke}} when {{subject}}\'s out with friends', order: 3 },
#                                                                         { display_value: 'quitting', value: 'quitting', description: '{{subject}} {{be}} trying to quit smoking', order: 4 },
#                                                                         { display_value: 'no', value: 'no', description: '{{subject}} {{does}}n\'t smoke', order: 5 },
#                                                                         { display_value: 'fuck no', value: 'fuck-no', description: '{{subject}} {{have}} never touched a cigarette in {{possessive}} life', order: 6 },
#                                                                       ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'drinker').id).blank?
#   FieldTemplate.find_or_create_by(name: 'drinker').field_values.create([
#                                                                          { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected whether {{subject}} drinks alcohol (yet)', default: true, order: 0 },
#                                                                          { display_value: 'alcoholic', value: 'alcoholic', description: '{{subject}} {{be}} an alcoholic', order: 1 },
#                                                                          { display_value: 'yes, heavily', value: 'heavily', description: '{{subject}} {{verb:drink}} a lot', order: 2 },
#                                                                          { display_value: 'yes', value: 'yes', description: '{{subject}} {{verb:drink}} alcohol', order: 3 },
#                                                                          { display_value: 'socially', value: 'socially', description: '{{subject}} {{verb:drink}} alcohol when {{subject}}\'s out with friends', order: 4 },
#                                                                          { display_value: 'quitting', value: 'quitting', description: '{{subject}} {{be}} trying to quit drinking', order: 5 },
#                                                                          { display_value: 'no', value: 'no', description: '{{subject}} {{does}}n\'t drink alcohol', order: 6 },
#                                                                          { display_value: 'in recovery', value: 'in-recovery', description: '{{subject}} {{be}} in recovery from alcoholism', order: 7 },
#                                                                          { display_value: 'teetotaler', value: 'teetotaler', description: '{{subject}} {{have}} never touched alcohol', order: 8 },
#                                                                        ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'dominance').id).blank?
#   FieldTemplate.find_or_create_by(name: 'dominance').field_values.create([
#                                                                            { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected how "dominant" {{subject}} is (yet)', default: true, order: 0 },
#                                                                            { display_value: 'total faggot', value: 0, description: 'A total submissive faggot.  Not a bone of dominance in its body.  It lives omly to serve at the feet of real Alpha Men.', order: 1 },
#                                                                            { display_value: 'faggot', value: 1,
#                                                                              description: 'A faggot that knows its place in the world is at the feet of real Alpha Men.  No dominance in its body, save for a fleeting glimmer of self-confidence before it comes to its senses and ' \
#                                                                                           'remembers its true place and purpose.', order: 2 },
#                                                                            { display_value: 'mostly fag', value: 2, description: 'Mostly a faggot.  Might stand up for itself once in a while but it\'s not comfortable doing it and looks hella dumb trying.', order: 3 },
#                                                                            { display_value: 'sub', value: 3, description: 'Submissive, but not a faggot.  Has some self-respect.  Stands up for himself occasionally and has {{possessive}} own life apart from the Alphas whom {{subject}} serves.',
#                                                                              order: 4 },
#                                                                            { display_value: 'switchy sub', value: 4, description: 'Switchy sub.  A switch who leans sub.  Might dom occasionally, but prefers to be sub.', order: 5 },
#                                                                            { display_value: 'switch', value: 5, description: 'Equal parts dom and sub.', order: 6 },
#                                                                            { display_value: 'switchy dom', value: 6, description: 'Switchy dom.  A switch who leans dom.  Might sub occasionally, but prefers to be dom.', order: 7 },
#                                                                            { display_value: 'dom', value: 7, description: 'Predominantly dominant, but might enjoy subbing for the right guy or under the right circumstances.', order: 8 },
#                                                                            { display_value: 'mostly dom', value: 8, description: 'Mostly dominant, but not an arrogant asshole about it.  Knows how to let his hair down on occasion.', order: 9 },
#                                                                            { display_value: 'beta dom', value: 9, description: 'Mostly dominant; might defer (but never submit) to an alpha dom', order: 10 },
#                                                                            { display_value: 'alpha dom', value: 10, description: 'Total dominant arrogant-as-fuck Alpha male.  The man exudes dominance whenever he walks into a room.  {{subject}} NEVER submits.  To anyone.', order: 11 },
#                                                                          ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'drug use').id).blank?
#   FieldTemplate.find_or_create_by(name: 'drug use').field_values.create([
#                                                                           { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected whether {{subject}} uses recreational drugs (yet)', default: true, order: 0 },
#                                                                           { display_value: 'addict', value: 'addict', description: '{{subject}} {{be}} a drug addict', order: 1 },
#                                                                           { display_value: 'junkie', value: 'junkie', description: '{{subject}} {{be}} a junkie', order: 2 },
#                                                                           { display_value: 'yes, heavily', value: 'heavily', description: '{{subject}} {{verb:use}} recreational drugs a lot', order: 3 },
#                                                                           { display_value: 'yes', value: 'yes', description: '{{subject}} {{verb:use}} recreational drugs', order: 4 },
#                                                                           { display_value: 'socially', value: 'socially', description: '{{subject}} {{verb:use}} recreational drugs when {{subject}}\'s out with friends', order: 5 },
#                                                                           { display_value: 'quitting', value: 'quitting', description: '{{subject}} {{be}} trying to quit using recreational drugs', order: 6 },
#                                                                           { display_value: 'no', value: 'no', description: '{{subject}} {{do}}n\'t use recreational drugs', order: 7 },
#                                                                           { display_value: 'in recovery', value: 'in-recovery', description: '{{subject}} {{be}} in recovery from drug addiction', order: 8 },
#                                                                           { display_value: 'fuck no', value: 'fuck-no', description: '{{subject}} {{have}} never and will never use recreational drugs', order: 9 },
#                                                                         ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'drugs of choice').id).blank?
#   FieldTemplate.find_or_create_by(name: 'drugs of choice').field_values.create([
#                                                                                  { value: nil, display_value: '[not entered]', description: '{{subject}} {{have}}n\'t entered any drugs of choice (yet)', default: true, order: 0 },
#                                                                                  { value: 'meth', display_value: 'methamphetamine',
#                                                                                    description: 'Methamphetamine is a powerful, highly addictive stimulant that affects the central nervous system. Known for its euphoric effects, it is used recreationally and, less commonly, for certain medical conditions.', order: 1 },
#                                                                                  { value: 'coke', display_value: 'cocaine', description: 'Cocaine is a powerful stimulant drug that is commonly used for recreational purposes. It is highly addictive and can have serious health effects.', order: 2 },
#                                                                                  { value: 'crack', display_value: 'crack cocaine', description: 'Crack cocaine is a highly addictive form of cocaine that is smoked. It is a powerful stimulant that can have serious health effects.', order: 3 },
#                                                                                  { value: 'heroin', display_value: 'heroin', description: 'Heroin is a highly addictive opioid drug that is commonly used for recreational purposes. It is illegal and can have serious health effects.', order: 4 },
#                                                                                  { value: 'opiates', display_value: 'opiates', description: 'Opiates are a class of drugs that are commonly used for pain relief. They can be highly addictive and have serious health effects.', order: 5 },
#                                                                                  { value: 'benzos', display_value: 'benzodiazepines',
#                                                                                    description: 'Benzodiazepines are a class of drugs that are commonly used for anxiety and sleep disorders. They can be highly addictive and have serious health effects.', order: 6 },
#                                                                                  { value: 'ecstasy', display_value: 'ecstasy', description: 'Ecstasy is a synthetic drug that is commonly used for recreational purposes. It is a stimulant and hallucinogen that can have serious health effects.',
#                                                                                    order: 7 },
#                                                                                  { value: 'lsd', display_value: 'LSD (acid)', description: 'LSD is a powerful hallucinogenic drug that is commonly used for recreational purposes. It can have serious health effects.', order: 8 },
#                                                                                  { value: 'mushrooms', display_value: 'magic mushrooms', description: 'Magic mushrooms are a type of hallucinogenic drug that is commonly used for recreational purposes. They can have serious health effects.',
#                                                                                    order: 9 },
#                                                                                  { value: 'weed', display_value: 'marijuana', description: 'Marijuana is a psychoactive drug that is commonly used for recreational purposes. It is legal in some states and can have serious health effects.', order: 10 },
#                                                                                  { value: 'methadone', display_value: 'methadone',
#                                                                                    description: 'Methadone is a synthetic opioid drug that is commonly used for pain relief and to treat opioid addiction. It can be highly addictive and have serious health effects.', order: 11 },
#                                                                                  { value: 'suboxone', display_value: 'suboxone',
#                                                                                    description: 'Suboxone is a combination of buprenorphine and naloxone that is commonly used to treat opioid addiction. It can be highly addictive and have serious health effects.', order: 12 },
#                                                                                  { value: 'ethanol', display_value: 'alcohol', description: 'Alcohol is a legal psychoactive drug that is commonly used for recreational purposes. It can be highly addictive and have serious health effects.',
#                                                                                    order: 13 },
#                                                                                  { value: 'pcp', display_value: 'PCP', description: 'PCP is a powerful hallucinogenic drug that is commonly used for recreational purposes. It can have serious health effects.', order: 14 },
#                                                                                  { value: 'trimix', display_value: 'trimix',
#                                                                                    description: 'Trimix is a compounded medication, not typically used recreationally, that consists of three drugs: papaverine, phentolamine, and alprostadil. It is primarily used to treat erectile dysfunction (ED) and is administered through intracavernosal injection directly into the penis.', order: 15 },
#                                                                                  { value: 'poppers', display_value: 'poppers',
#                                                                                    description: 'Amyl nitrate, often confused with amyl nitrite, is a chemical compound used in certain industrial processes. Amyl nitrite, on the other hand, is a vasodilator often used recreationally and for medical purposes to treat heart diseases like angina. Recreational users seek the drug for its brief but intense effects that enhance sexual experiences and produce a \'rush\' or \'high.\'', order: 16 },
#                                                                                  { value: 'k', display_value: 'ketamine',
#                                                                                    description: 'Ketamine is a powerful dissociative anesthetic used in both human and veterinary medicine. It has gained popularity as a recreational drug for its hallucinogenic and dissociative effects, allowing users to experience altered perceptions of time and space.', order: 17 },
#                                                                                  { value: 'g', display_value: 'GHB/GBL',
#                                                                                    descripion: 'GHB (Gamma-Hydroxybutyrate) and GBL (Gamma-Butyrolactone) are closely related drugs, with GBL being a prodrug to GHB. They are central nervous system depressants with similar effects. GHB is naturally found in small amounts in the human body. Both are used medically for narcolepsy treatment and recreationally for their euphoric and sedative effects.', order: 18 },
#                                                                                  { value: 'imodium', display_value: 'loperamide (imodium)',
#                                                                                    description: 'Loperamide, commonly known by the brand name Imodium, is an over-the-counter medication used to treat diarrhea. It is an opioid receptor agonist, meaning it binds to opioid receptors in the gut to slow down bowel movements and reduce diarrhea. While loperamide is safe and effective when used as directed, it can be dangerous and even deadly when misused or abused.', order: 19 },
#                                                                                  { value: 'mdma', display_value: 'MDMA',
#                                                                                    description: 'MDMA (3,4-methylenedioxymethamphetamine), commonly known as ecstasy or molly, is a synthetic drug that alters mood and perception. It is chemically similar to both stimulants and hallucinogens, producing feelings of increased energy, pleasure, emotional warmth, and distorted sensory and time perception.', order: 20 },
#                                                                                  { value: 'ed', display_value: 'erectile dysfunction medication',
#                                                                                    description: 'Erectile dysfunction (ED) medications are drugs that treat erectile dysfunction, a condition characterized by the inability to get or maintain an erection suitable for sexual intercourse. The most common ED medications belong to a class of drugs known as phosphodiesterase type 5 inhibitors (PDE5 inhibitors).', order: 21 },
#                                                                                  { value: 'other', display_value: 'other', description: 'Some other drug of choice', order: 22 },
#                                                                                  { value: 'laughing-gas', display_value: 'nitrous oxide (laughing gas)',
#                                                                                    description: 'Nitrous oxide, commonly known as laughing gas, is a chemical compound, an oxide of nitrogen with the formula N2O. It is used recreationally for its euphoric and relaxing effects.', order: 23 },
#                                                                                  { value: 'speed', display_value: 'speed',
#                                                                                    description: 'Speed is a slang term for amphetamine, a powerful stimulant drug that affects the central nervous system. It is commonly used for recreational purposes and can have serious health effects.', order: 24 },
#                                                                                  { value: 'other', display_value: 'other', description: 'Some other drug of choice', order: 13 },
#                                                                                ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'kinks/fetishes').id).blank?
#   FieldTemplate.find_or_create_by(name: 'kinks/fetishes').field_values.create([
#                                                                                 { value: nil, display_value: '[not entered]', description: '{{subject}} {{have}}n\'t entered any kinks or fetishes (yet)', default: true },
#                                                                               ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'body hair').id).blank?
#   FieldTemplate.find_or_create_by(name: 'body hair').field_values.create([
#                                                                            { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t entered {{possessive}} body hair (yet)', default: true },
#                                                                            { display_value: 'naturally smooth', value: 0, description: '{{subject}} {{have}} a naturally smooth body' },
#                                                                            { display_value: 'shaved smooth', value: 1, description: '{{subject}} {{verb:shave}} {{possessive}} hair off' },
#                                                                            { display_value: 'trimmed', value: 1, description: '{{subject}} {{verb:trim}} {{possessive}} body hair' },
#                                                                            { display_value: 'some hair', value: 2, description: '{{subject}} {{have}} some hair on {{possessive}} body' },
#                                                                            { display_value: 'hairy', value: 3, description: '{{subject}} {{be}} hairy' },
#                                                                            { display_value: 'very hairy', value: 4, description: '{{subject}} {{have}} lots of body hair' },
#                                                                            { display_value: 'sasquatch', value: 5, description: '{{subject}} might as well be fucking Bigfoot!' },
#                                                                          ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'height').id).blank?
#   FieldTemplate.find_or_create_by(name: 'height').field_values.create([
#                                                                         { value: nil, display_value: '[not entered]', description: '{{subject}} {{have}}n\'t entered {{possessive}} height (yet)', default: true },
#                                                                         { display_value: '2ft (61cm)', value: 24, description: '{{subject}} {{be}} 2 feet (61 centimeters) tall' },
#                                                                         { display_value: '2ft 1in (64cm)', value: 25, description: '{{subject}} {{be}} 2 feet 1 inches (64 centimeters) tall' },
#                                                                         { display_value: '2ft 2in (66cm)', value: 26, description: '{{subject}} {{be}} 2 feet 2 inches (66 centimeters) tall' },
#                                                                         { display_value: '2ft 3in (69cm)', value: 27, description: '{{subject}} {{be}} 2 feet 3 inches (69 centimeters) tall' },
#                                                                         { display_value: '2ft 4in (71cm)', value: 28, description: '{{subject}} {{be}} 2 feet 4 inches (71 centimeters) tall' },
#                                                                         { display_value: '2ft 5in (74cm)', value: 29, description: '{{subject}} {{be}} 2 feet 5 inches (74 centimeters) tall' },
#                                                                         { display_value: '2ft 6in (76cm)', value: 30, description: '{{subject}} {{be}} 2 feet 6 inches (76 centimeters) tall' },
#                                                                         { display_value: '2ft 7in (79cm)', value: 31, description: '{{subject}} {{be}} 2 feet 7 inches (79 centimeters) tall' },
#                                                                         { display_value: '2ft 8in (81cm)', value: 32, description: '{{subject}} {{be}} 2 feet 8 inches (81 centimeters) tall' },
#                                                                         { display_value: '2ft 9in (84cm)', value: 33, description: '{{subject}} {{be}} 2 feet 9 inches (84 centimeters) tall' },
#                                                                         { display_value: '2ft 10in (86cm)', value: 34, description: '{{subject}} {{be}} 2 feet 10 inches (86 centimeters) tall' },
#                                                                         { display_value: '2ft 11in (89cm)', value: 35, description: '{{subject}} {{be}} 2 feet 11 inches (89 centimeters) tall' },
#                                                                         { display_value: '3ft (91cm)', value: 36, description: '{{subject}} {{be}} 3 feet (91 centimeters) tall' },
#                                                                         { display_value: '3ft 1in (94cm)', value: 37, description: '{{subject}} {{be}} 3 feet 1 inches (94 centimeters) tall' },
#                                                                         { display_value: '3ft 2in (97cm)', value: 38, description: '{{subject}} {{be}} 3 feet 2 inches (97 centimeters) tall' },
#                                                                         { display_value: '3ft 3in (99cm)', value: 39, description: '{{subject}} {{be}} 3 feet 3 inches (99 centimeters) tall' },
#                                                                         { display_value: '3ft 4in (102cm)', value: 40, description: '{{subject}} {{be}} 3 feet 4 inches (102 centimeters) tall' },
#                                                                         { display_value: '3ft 5in (104cm)', value: 41, description: '{{subject}} {{be}} 3 feet 5 inches (104 centimeters) tall' },
#                                                                         { display_value: '3ft 6in (107cm)', value: 42, description: '{{subject}} {{be}} 3 feet 6 inches (107 centimeters) tall' },
#                                                                         { display_value: '3ft 7in (109cm)', value: 43, description: '{{subject}} {{be}} 3 feet 7 inches (109 centimeters) tall' },
#                                                                         { display_value: '3ft 8in (112cm)', value: 44, description: '{{subject}} {{be}} 3 feet 8 inches (112 centimeters) tall' },
#                                                                         { display_value: '3ft 9in (114cm)', value: 45, description: '{{subject}} {{be}} 3 feet 9 inches (114 centimeters) tall' },
#                                                                         { display_value: '3ft 10in (117cm)', value: 46, description: '{{subject}} {{be}} 3 feet 10 inches (117 centimeters) tall' },
#                                                                         { display_value: '3ft 11in (119cm)', value: 47, description: '{{subject}} {{be}} 3 feet 11 inches (119 centimeters) tall' },
#                                                                         { display_value: '4ft (122cm)', value: 48, description: '{{subject}} {{be}} 4 feet (122 centimeters) tall' },
#                                                                         { display_value: '4ft 1in (124cm)', value: 49, description: '{{subject}} {{be}} 4 feet 1 inches (124 centimeters) tall' },
#                                                                         { display_value: '4ft 2in (127cm)', value: 50, description: '{{subject}} {{be}} 4 feet 2 inches (127 centimeters) tall' },
#                                                                         { display_value: '4ft 3in (130cm)', value: 51, description: '{{subject}} {{be}} 4 feet 3 inches (130 centimeters) tall' },
#                                                                         { display_value: '4ft 4in (132cm)', value: 52, description: '{{subject}} {{be}} 4 feet 4 inches (132 centimeters) tall' },
#                                                                         { display_value: '4ft 5in (135cm)', value: 53, description: '{{subject}} {{be}} 4 feet 5 inches (135 centimeters) tall' },
#                                                                         { display_value: '4ft 6in (137cm)', value: 54, description: '{{subject}} {{be}} 4 feet 6 inches (137 centimeters) tall' },
#                                                                         { display_value: '4ft 7in (140cm)', value: 55, description: '{{subject}} {{be}} 4 feet 7 inches (140 centimeters) tall' },
#                                                                         { display_value: '4ft 8in (142cm)', value: 56, description: '{{subject}} {{be}} 4 feet 8 inches (142 centimeters) tall' },
#                                                                         { display_value: '4ft 9in (145cm)', value: 57, description: '{{subject}} {{be}} 4 feet 9 inches (145 centimeters) tall' },
#                                                                         { display_value: '4ft 10in (147cm)', value: 58, description: '{{subject}} {{be}} 4 feet 10 inches (147 centimeters) tall' },
#                                                                         { display_value: '4ft 11in (150cm)', value: 59, description: '{{subject}} {{be}} 4 feet 11 inches (150 centimeters) tall' },
#                                                                         { display_value: '5ft (152cm)', value: 60, description: '{{subject}} {{be}} 5 feet (152 centimeters) tall' },
#                                                                         { display_value: '5ft 1in (155cm)', value: 61, description: '{{subject}} {{be}} 5 feet 1 inches (155 centimeters) tall' },
#                                                                         { display_value: '5ft 2in (157cm)', value: 62, description: '{{subject}} {{be}} 5 feet 2 inches (157 centimeters) tall' },
#                                                                         { display_value: '5ft 3in (160cm)', value: 63, description: '{{subject}} {{be}} 5 feet 3 inches (160 centimeters) tall' },
#                                                                         { display_value: '5ft 4in (163cm)', value: 64, description: '{{subject}} {{be}} 5 feet 4 inches (163 centimeters) tall' },
#                                                                         { display_value: '5ft 5in (165cm)', value: 65, description: '{{subject}} {{be}} 5 feet 5 inches (165 centimeters) tall' },
#                                                                         { display_value: '5ft 6in (168cm)', value: 66, description: '{{subject}} {{be}} 5 feet 6 inches (168 centimeters) tall' },
#                                                                         { display_value: '5ft 7in (170cm)', value: 67, description: '{{subject}} {{be}} 5 feet 7 inches (170 centimeters) tall' },
#                                                                         { display_value: '5ft 8in (173cm)', value: 68, description: '{{subject}} {{be}} 5 feet 8 inches (173 centimeters) tall' },
#                                                                         { display_value: '5ft 9in (175cm)', value: 69, description: '{{subject}} {{be}} 5 feet 9 inches (175 centimeters) tall' },
#                                                                         { display_value: '5ft 10in (178cm)', value: 70, description: '{{subject}} {{be}} 5 feet 10 inches (178 centimeters) tall' },
#                                                                         { display_value: '5ft 11in (180cm)', value: 71, description: '{{subject}} {{be}} 5 feet 11 inches (180 centimeters) tall' },
#                                                                         { display_value: '6ft (183cm)', value: 72, description: '{{subject}} {{be}} 6 feet (183 centimeters) tall' },
#                                                                         { display_value: '6ft 1in (185cm)', value: 73, description: '{{subject}} {{be}} 6 feet 1 inches (185 centimeters) tall' },
#                                                                         { display_value: '6ft 2in (188cm)', value: 74, description: '{{subject}} {{be}} 6 feet 2 inches (188 centimeters) tall' },
#                                                                         { display_value: '6ft 3in (191cm)', value: 75, description: '{{subject}} {{be}} 6 feet 3 inches (191 centimeters) tall' },
#                                                                         { display_value: '6ft 4in (193cm)', value: 76, description: '{{subject}} {{be}} 6 feet 4 inches (193 centimeters) tall' },
#                                                                         { display_value: '6ft 5in (196cm)', value: 77, description: '{{subject}} {{be}} 6 feet 5 inches (196 centimeters) tall' },
#                                                                         { display_value: '6ft 6in (198cm)', value: 78, description: '{{subject}} {{be}} 6 feet 6 inches (198 centimeters) tall' },
#                                                                         { display_value: '6ft 7in (201cm)', value: 79, description: '{{subject}} {{be}} 6 feet 7 inches (201 centimeters) tall' },
#                                                                         { display_value: '6ft 8in (203cm)', value: 80, description: '{{subject}} {{be}} 6 feet 8 inches (203 centimeters) tall' },
#                                                                         { display_value: '6ft 9in (206cm)', value: 81, description: '{{subject}} {{be}} 6 feet 9 inches (206 centimeters) tall' },
#                                                                         { display_value: '6ft 10in (208cm)', value: 82, description: '{{subject}} {{be}} 6 feet 10 inches (208 centimeters) tall' },
#                                                                         { display_value: '6ft 11in (211cm)', value: 83, description: '{{subject}} {{be}} 6 feet 11 inches (211 centimeters) tall' },
#                                                                         { display_value: '7ft (213cm)', value: 84, description: '{{subject}} {{be}} 7 feet (213 centimeters) tall' },
#                                                                         { display_value: '7ft 1in (216cm)', value: 85, description: '{{subject}} {{be}} 7 feet 1 inches (216 centimeters) tall' },
#                                                                         { display_value: '7ft 2in (218cm)', value: 86, description: '{{subject}} {{be}} 7 feet 2 inches (218 centimeters) tall' },
#                                                                         { display_value: '7ft 3in (221cm)', value: 87, description: '{{subject}} {{be}} 7 feet 3 inches (221 centimeters) tall' },
#                                                                         { display_value: '7ft 4in (224cm)', value: 88, description: '{{subject}} {{be}} 7 feet 4 inches (224 centimeters) tall' },
#                                                                         { display_value: '7ft 5in (226cm)', value: 89, description: '{{subject}} {{be}} 7 feet 5 inches (226 centimeters) tall' },
#                                                                         { display_value: '7ft 6in (229cm)', value: 90, description: '{{subject}} {{be}} 7 feet 6 inches (229 centimeters) tall' },
#                                                                         { display_value: '7ft 7in (231cm)', value: 91, description: '{{subject}} {{be}} 7 feet 7 inches (231 centimeters) tall' },
#                                                                         { display_value: '7ft 8in (234cm)', value: 92, description: '{{subject}} {{be}} 7 feet 8 inches (234 centimeters) tall' },
#                                                                         { display_value: '7ft 9in (236cm)', value: 93, description: '{{subject}} {{be}} 7 feet 9 inches (236 centimeters) tall' },
#                                                                         { display_value: '7ft 10in (239cm)', value: 94, description: '{{subject}} {{be}} 7 feet 10 inches (239 centimeters) tall' },
#                                                                         { display_value: '7ft 11in (241cm)', value: 95, description: '{{subject}} {{be}} 7 feet 11 inches (241 centimeters) tall' },
#                                                                       ])
# end

# if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'weight').id).blank?
#   FieldTemplate.find_or_create_by(name: 'weight').field_values.create([
#                                                                         { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t entered {{possessive}} weight (yet)', default: true },
#                                                                         { display_value: '90lbs (41kg)', value: 90, description: '{{subject}} {{verb:weigh}} 90 pounds (41 kilograms)' },
#                                                                         { display_value: '95lbs (43kg)', value: 95, description: '{{subject}} {{verb:weigh}} 95 pounds (43 kilograms)' },
#                                                                         { display_value: '100lbs (45kg)', value: 100, description: '{{subject}} {{verb:weigh}} 100 pounds (45 kilograms)' },
#                                                                         { display_value: '105lbs (48kg)', value: 105, description: '{{subject}} {{verb:weigh}} 105 pounds (48 kilograms)' },
#                                                                         { display_value: '110lbs (50kg)', value: 110, description: '{{subject}} {{verb:weigh}} 110 pounds (50 kilograms)' },
#                                                                         { display_value: '115lbs (52kg)', value: 115, description: '{{subject}} {{verb:weigh}} 115 pounds (52 kilograms)' },
#                                                                         { display_value: '120lbs (54kg)', value: 120, description: '{{subject}} {{verb:weigh}} 120 pounds (54 kilograms)' },
#                                                                         { display_value: '125lbs (57kg)', value: 125, description: '{{subject}} {{verb:weigh}} 125 pounds (57 kilograms)' },
#                                                                         { display_value: '130lbs (59kg)', value: 130, description: '{{subject}} {{verb:weigh}} 130 pounds (59 kilograms)' },
#                                                                         { display_value: '135lbs (61kg)', value: 135, description: '{{subject}} {{verb:weigh}} 135 pounds (61 kilograms)' },
#                                                                         { display_value: '140lbs (64kg)', value: 140, description: '{{subject}} {{verb:weigh}} 140 pounds (64 kilograms)' },
#                                                                         { display_value: '145lbs (66kg)', value: 145, description: '{{subject}} {{verb:weigh}} 145 pounds (66 kilograms)' },
#                                                                         { display_value: '150lbs (68kg)', value: 150, description: '{{subject}} {{verb:weigh}} 150 pounds (68 kilograms)' },
#                                                                         { display_value: '155lbs (70kg)', value: 155, description: '{{subject}} {{verb:weigh}} 155 pounds (70 kilograms)' },
#                                                                         { display_value: '160lbs (73kg)', value: 160, description: '{{subject}} {{verb:weigh}} 160 pounds (73 kilograms)' },
#                                                                         { display_value: '165lbs (75kg)', value: 165, description: '{{subject}} {{verb:weigh}} 165 pounds (75 kilograms)' },
#                                                                         { display_value: '170lbs (77kg)', value: 170, description: '{{subject}} {{verb:weigh}} 170 pounds (77 kilograms)' },
#                                                                         { display_value: '175lbs (79kg)', value: 175, description: '{{subject}} {{verb:weigh}} 175 pounds (79 kilograms)' },
#                                                                         { display_value: '180lbs (82kg)', value: 180, description: '{{subject}} {{verb:weigh}} 180 pounds (82 kilograms)' },
#                                                                         { display_value: '185lbs (84kg)', value: 185, description: '{{subject}} {{verb:weigh}} 185 pounds (84 kilograms)' },
#                                                                         { display_value: '190lbs (86kg)', value: 190, description: '{{subject}} {{verb:weigh}} 190 pounds (86 kilograms)' },
#                                                                         { display_value: '195lbs (88kg)', value: 195, description: '{{subject}} {{verb:weigh}} 195 pounds (88 kilograms)' },
#                                                                         { display_value: '200lbs (91kg)', value: 200, description: '{{subject}} {{verb:weigh}} 200 pounds (91 kilograms)' },
#                                                                         { display_value: '205lbs (93kg)', value: 205, description: '{{subject}} {{verb:weigh}} 205 pounds (93 kilograms)' },
#                                                                         { display_value: '210lbs (95kg)', value: 210, description: '{{subject}} {{verb:weigh}} 210 pounds (95 kilograms)' },
#                                                                         { display_value: '215lbs (98kg)', value: 215, description: '{{subject}} {{verb:weigh}} 215 pounds (98 kilograms)' },
#                                                                         { display_value: '220lbs (100kg)', value: 220, description: '{{subject}} {{verb:weigh}} 220 pounds (100 kilograms)' },
#                                                                         { display_value: '225lbs (102kg)', value: 225, description: '{{subject}} {{verb:weigh}} 225 pounds (102 kilograms)' },
#                                                                         { display_value: '230lbs (104kg)', value: 230, description: '{{subject}} {{verb:weigh}} 230 pounds (104 kilograms)' },
#                                                                         { display_value: '235lbs (107kg)', value: 235, description: '{{subject}} {{verb:weigh}} 235 pounds (107 kilograms)' },
#                                                                         { display_value: '240lbs (109kg)', value: 240, description: '{{subject}} {{verb:weigh}} 240 pounds (109 kilograms)' },
#                                                                         { display_value: '245lbs (111kg)', value: 245, description: '{{subject}} {{verb:weigh}} 245 pounds (111 kilograms)' },
#                                                                         { display_value: '250lbs (113kg)', value: 250, description: '{{subject}} {{verb:weigh}} 250 pounds (113 kilograms)' },
#                                                                         { display_value: '255lbs (116kg)', value: 255, description: '{{subject}} {{verb:weigh}} 255 pounds (116 kilograms)' },
#                                                                         { display_value: '260lbs (118kg)', value: 260, description: '{{subject}} {{verb:weigh}} 260 pounds (118 kilograms)' },
#                                                                         { display_value: '265lbs (120kg)', value: 265, description: '{{subject}} {{verb:weigh}} 265 pounds (120 kilograms)' },
#                                                                         { display_value: '270lbs (122kg)', value: 270, description: '{{subject}} {{verb:weigh}} 270 pounds (122 kilograms)' },
#                                                                         { display_value: '275lbs (125kg)', value: 275, description: '{{subject}} {{verb:weigh}} 275 pounds (125 kilograms)' },
#                                                                         { display_value: '280lbs (127kg)', value: 280, description: '{{subject}} {{verb:weigh}} 280 pounds (127 kilograms)' },
#                                                                         { display_value: '285lbs (129kg)', value: 285, description: '{{subject}} {{verb:weigh}} 285 pounds (129 kilograms)' },
#                                                                         { display_value: '290lbs (132kg)', value: 290, description: '{{subject}} {{verb:weigh}} 290 pounds (132 kilograms)' },
#                                                                         { display_value: '295lbs (134kg)', value: 295, description: '{{subject}} {{verb:weigh}} 295 pounds (134 kilograms)' },
#                                                                         { display_value: '300lbs (136kg)', value: 300, description: '{{subject}} {{verb:weigh}} 300 pounds (136 kilograms)' },
#                                                                         { display_value: '305lbs (138kg)', value: 305, description: '{{subject}} {{verb:weigh}} 305 pounds (138 kilograms)' },
#                                                                       ])
# end
