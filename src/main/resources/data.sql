INSERT INTO trainingtype (trainingtype) VALUES
    ('yoga'),
    ('fitness'),
	('Zumba'),
	('stretching'),
	('resistance');

INSERT INTO gym_user (firstName, lastName, username, user_password, isActive) VALUES
    ('Ward', 'Mejia', 'Ward.Mejia', '8155945829', true),
    ('Kathleen', 'Carr', 'Kathleen.Carr', '7545019305', true),
	('Coleman', 'Yates', 'Coleman.Yates', '4415125129', true),
	('Frazie', 'Richards', 'Frazier.Richards', '4946535140', true),
	('Myrna', 'Estrada', 'Myrna.Estrada', '5952019021', true),
	('Dave', 'Batista', 'Dave.Batista', '1234567895', true),
	('Igor', 'Gura', 'Igor.Gura', '1237767895', true),
	('Allyson', 'Bauer', 'Allyson.Bauer', '1753706703', true),
	('Mari', 'Doyle', 'Mari.Doyle', '1753799703', true),
	('Shannon', 'Velazquez', 'Shannon.Velazquez', '1788799703', true);

INSERT INTO trainer (specialization_id, gym_user_id) VALUES
	((SELECT trainingType_id FROM trainingtype WHERE trainingType = 'yoga'), (SELECT gym_user_id FROM gym_user WHERE username = 'Ward.Mejia')),
	((SELECT trainingType_id FROM trainingtype WHERE trainingType = 'fitness'), (SELECT gym_user_id FROM gym_user WHERE username = 'Kathleen.Carr')),
	((SELECT trainingType_id FROM trainingtype WHERE trainingType = 'Zumba'), (SELECT gym_user_id FROM gym_user WHERE username = 'Coleman.Yates')),
	((SELECT trainingType_id FROM trainingtype WHERE trainingType = 'stretching'), (SELECT gym_user_id FROM gym_user WHERE username = 'Frazier.Richards')),
	((SELECT trainingType_id FROM trainingtype WHERE trainingType = 'resistance'), (SELECT gym_user_id FROM gym_user WHERE username = 'Myrna.Estrada'));

INSERT INTO trainee (dateOfBirth, address, gym_user_id) VALUES
	('2008-08-06', '467 Boerum Street, Bedias, Mississippi, 8314', (SELECT gym_user_id FROM gym_user WHERE username = 'Dave.Batista')),
	('2002-06-11', '745 Senator Street, Abiquiu, Northern Mariana Islands, 5722', (SELECT gym_user_id FROM gym_user WHERE username = 'Igor.Gura')),
	('1983-11-1', '491 Crosby Avenue, Marenisco, Arkansas, 2771', (SELECT gym_user_id FROM gym_user WHERE username = 'Allyson.Bauer')),
	('1988-12-02', '139 Micieli Place, Corriganville, Florida, 3783', (SELECT gym_user_id FROM gym_user WHERE username = 'Mari.Doyle')),
	('1999-10-05', '933 Dewey Place, Northchase, District Of Columbia, 1061', (SELECT gym_user_id FROM gym_user WHERE username = 'Shannon.Velazquez'));

INSERT INTO trainee_trainer (trainee_id, trainer_id) VALUES
    ((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Dave.Batista'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Kathleen.Carr')),
    ((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Igor.Gura'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Myrna.Estrada')),
    ((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Allyson.Bauer'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Coleman.Yates')),
    ((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Mari.Doyle'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Ward.Mejia')),
    ((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Shannon.Velazquez'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Frazier.Richards')),
    ((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Shannon.Velazquez'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Coleman.Yates')),
    ((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Shannon.Velazquez'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Ward.Mejia'));

INSERT INTO Training (trainee_id, trainer_id, trainingName, trainingType_id, trainingDay, trainingDuration) VALUES
	((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Dave.Batista'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Kathleen.Carr'),
	'aerobics', (SELECT trainingType_id FROM trainingtype WHERE trainingType = 'fitness'), '2024-03-21', 150),
	((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Igor.Gura'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Myrna.Estrada'),
    'pilates', (SELECT trainingType_id FROM trainingtype WHERE trainingType = 'resistance'), '2024-12-28', 90),
	((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Allyson.Bauer'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Coleman.Yates'),
    'Zumba step', (SELECT trainingType_id FROM trainingtype WHERE trainingType = 'Zumba'), '2024-08-27', 60),
	((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Mari.Doyle'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Ward.Mejia'),
    'vinyasa', (SELECT trainingType_id FROM trainingtype WHERE trainingType = 'yoga'), '2024-09-30', 150),
	((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Shannon.Velazquez'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Frazier.Richards'),
    'dynamic stretching', (SELECT trainingType_id FROM trainingtype WHERE trainingType = 'stretching'), '2024-11-07', 60),
	((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Shannon.Velazquez'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Coleman.Yates'),
    'Zumba step', (SELECT trainingType_id FROM trainingtype WHERE trainingType = 'Zumba'), '2024-10-27', 60),
	((SELECT trainee_id FROM trainee JOIN gym_user ON trainee.gym_user_id = gym_user.gym_user_id WHERE username = 'Shannon.Velazquez'),
    (SELECT trainer_id FROM trainer JOIN gym_user ON trainer.gym_user_id = gym_user.gym_user_id WHERE username = 'Ward.Mejia'),
    'vinyasa', (SELECT trainingType_id FROM trainingtype WHERE trainingType = 'yoga'), '2024-11-21', 120);