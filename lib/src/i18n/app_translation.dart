import 'package:flutter/material.dart';
import 'package:piece_fruits/src/models/language_model.dart';

final Map<String, Map<String, String>> translationsKeys = {
  'en_US': enUS,
  'pt_BR': ptBR,
  'es_ES': esES,
};

final List<LanguageModel> languages = [
  LanguageModel('en-US', const Locale('en', 'US')),
  LanguageModel('pt-BR', const Locale('pt', 'BR')),
  LanguageModel('es-ES', const Locale('es', 'ES')),
];

final Map<String, String> enUS = {
  'side.bar.game.time': 'game time',
  'side.bar.immunity': 'immunity',
  'side.bar.no.immunity': 'Vulnerable',
  'side.bar.menu.overview.title': 'Overview',
  'side.bar.menu.overview.subtitle': 'This is your character data overview',
  'side.bar.menu.change.character.title': 'Change character',
  'side.bar.menu.change.character.subtitle':
      'Switch between characters on your account',
  'side.bar.menu.logout.title': 'Logout',
  'side.bar.menu.logout.subtitle': 'Log out of your account to log in again',
  'dialog.confirmation.title': 'Attention!',
  'dialog.confirmation.cancel.button': 'Cancel',
  'dialog.confirmation.confirm.button': 'Confirm',
  'dialog.confirmation.content':
      'Do you want to confirm your action? it will not be possible to revert',
  'faction.pirate': 'Pirate',
  'faction.marine': 'Marine',
  'faction.revolutionary': 'Revolutionary',
  'gender.male': 'Male',
  'gender.female': 'Female',
  'gender.other': 'Other',
  'landing.page.connection': 'Connecting to the server...',
  'landing.page.version':
      'There is a new update available, please update the app on your store...',
  'landing.page.start': 'Preparing to start...',
  'landing.page.try.connect.button': 'Try again',
  'connection.failure': 'Failed to connect to server',
  'connection.login.button': 'Login',
  'validation.field.empty': 'Please this field must be filled',
  'validation.field.email': 'Please, type a valid email',
  'validation.field.password.confirmation': 'Passwords must be the same',
  'validation.field.password.length':
      'Password must contain at least 6 characters',
  'validation.field.name':
      'The name can contain letters, numbers and underscore character separating each letter, the first and last character must be alphanumeric',
  'validation.field.name.length':
      'The name must contain a minimum of 3 characters and a maximum of 20 characters',
  'login.page.title': 'Login',
  'login.page.button': 'Play now',
  'login.page.email': 'Email',
  'login.page.password': 'Password',
  'login.page.have.registration': "Don't have a registration?",
  'login.page.register.button': 'Register',
  'register.page.title': 'Register',
  'register.page.email': 'Email',
  'register.page.password': 'Password',
  'register.page.password.confirmation': 'Confirm the password',
  'register.page.gender': 'Gender',
  'register.page.birth.date': 'Birth date',
  'register.page.button': 'Register',
  'register.page.service.terms.text':
      'By creating an account you agree to read all ',
  'register.page.service.terms.action': 'Service terms',
  'account.character.page.title': 'Characters',
  'account.character.page.play.button': 'Play',
  'account.character.page.create.button': 'Create',
  'create.account.character.page.title': 'Create character',
  'create.account.character.page.first.title': 'Character information',
  'create.account.character.page.first.subtitle':
      'Choose your name and your faction',
  'create.account.character.page.step.first.name': "Character's name",
  'create.account.character.page.step.first.faction': 'Faction',
  'create.account.character.page.step.two.title': 'Select a character',
  'create.account.character.page.step.three.title': 'Finalize',
  'create.account.character.page.step.three.row.first': "Character's name",
  'create.account.character.page.step.three.row.two': 'Character',
  'create.account.character.page.step.three.row.three': 'Faction',
  'create.account.character.page.button.next': 'Next',
  'create.account.character.page.button.complete': 'Complete',
  'create.account.character.page.button.back': 'Back',
  'create.account.character.page.dialog.title': 'Create a new character',
  'create.account.character.page.dialog.content.first':
      'You can create up to 4 characters.',
  'create.account.character.page.dialog.content.two':
      'You can only create initial characters.',
  'create.account.character.page.dialog.content.three':
      'Choose a name and faction to create your first character.',
  'create.account.character.page.dialog.content.four':
      'You can later change the character, faction and name.',
  'create.account.character.page.dialog.button': 'Close',
  'overview.page.title': 'Overview',
  'overview.page.premium.button': 'Premium',
  'overview.page.edit.button': 'Edit',
  'overview.page.faction': 'faction',
  'overview.page.no.crew': 'No crew',
  'overview.page.crew': 'crew',
  'overview.page.bounty': 'bounty',
  'overview.page.fame': 'fame',
  'overview.page.power': 'power',
  'overview.page.discord.message':
      "Tap to join the game's discord group. Come have fun with the community and ask your questions.",
  'overview.page.attributes': 'Attributes',
  'overview.page.attribute.punch': 'Punch',
  'overview.page.attribute.defense': 'Defense',
  'overview.page.attribute.sword': 'Sword',
  'overview.page.attribute.weapon': 'Weapon',
  'overview.page.attribute.fruit': 'Fruit',
  'overview.page.base.attribute': 'base',
  'overview.page.train.button': 'Train',
  'overview.page.statistics': 'Statistics',
  'overview.page.experience': 'Experience',
  'overview.page.honor.win': 'Honor wins',
  'overview.page.total.battle': 'Total battles',
  'overview.page.win': 'Wins',
  'overview.page.defeat': 'Defeats',
  'overview.page.draw': 'Draws',
  'overview.page.damage.hit': 'Damage hit',
  'overview.page.damage.taken': 'Damage taken',
  'overview.page.belly.won': 'Belly won',
  'overview.page.belly.lost': 'Belly lost',
  'overview.page.score': 'Score',
  'overview.page.biography': 'Biography',
  'overview.page.no.biography': 'No biography',
  'overview.page.enter.biography':
      'Enter a short biography to appear on your profile',
  'overview.page.biography.save.button': 'Save',
  'overview.validation.field.biography.length':
      'The biography must contain a minimum of 10 characters and a maximum of 200 characters',
};

final Map<String, String> ptBR = {
  'side.bar.game.time': 'tempo do jogo',
  'side.bar.immunity': 'imunidade',
  'side.bar.no.immunity': 'Vulnerável',
  'side.bar.menu.overview.title': 'Visão geral',
  'side.bar.menu.overview.subtitle':
      'Esta é a visão geral dos dados do seu personagem',
  'side.bar.menu.change.character.title': 'Trocar de personagem',
  'side.bar.menu.change.character.subtitle':
      'Alterne entre os personagens da sua conta',
  'side.bar.menu.logout.title': 'Sair',
  'side.bar.menu.logout.subtitle':
      'Faça logout da sua conta para realizar o login novamente',
  'dialog.confirmation.title': 'Atenção!',
  'dialog.confirmation.cancel.button': 'Cancelar',
  'dialog.confirmation.confirm.button': 'Confirmar',
  'dialog.confirmation.content':
      'Deseja confirmar sua ação? não será possível reverter',
  'faction.pirate': 'Pirata',
  'faction.marine': 'Marinheiro',
  'faction.revolutionary': 'Revolucionário',
  'gender.male': 'Masculino',
  'gender.female': 'Feminino',
  'gender.other': 'Outro',
  'landing.page.connection': 'Conectando no servidor...',
  'landing.page.version':
      'Há uma nova atualização disponível, por favor atualize a aplicação na sua loja.',
  'landing.page.start': 'Preparando para iniciar...',
  'landing.page.try.connect.button': 'Tentar novamente',
  'connection.failure': 'Falha ao conectar no servidor',
  'connection.login.button': 'Realizar login',
  'validation.field.empty': 'Por favor, este campo deve ser preenchido',
  'validation.field.email': 'Por favor, digite um e-mail válido',
  'validation.field.password.confirmation': 'As senhas devem ser iguais',
  'validation.field.password.length':
      'A senha deve conter pelo menos 6 caracteres',
  'validation.field.name':
      'O nome pode conter letras, números e caractere underscore separando a cada letra, o primeiro e último caractere deve ser alfanuméricos',
  'validation.field.name.length':
      'O nome deve conter no mínimo 3 caracteres e no máximo 20 caracteres',
  'login.page.title': 'Conecte-se',
  'login.page.button': 'Jogue agora',
  'login.page.email': 'E-mail',
  'login.page.password': 'Senha',
  'login.page.have.registration': 'Não tem cadastro?',
  'login.page.register.button': 'Cadastre-se',
  'register.page.title': 'Cadastre-se',
  'register.page.email': 'E-mail',
  'register.page.password': 'Senha',
  'register.page.password.confirmation': 'Confirme a senha',
  'register.page.gender': 'Gênero',
  'register.page.birth.date': 'Data de nascimento',
  'register.page.button': 'Registrar',
  'register.page.service.terms.text':
      'Ao criar uma conta você aceita ler todos os ',
  'register.page.service.terms.action': 'Termos de serviço',
  'account.character.page.title': 'Personagens',
  'account.character.page.play.button': 'Jogar',
  'account.character.page.create.button': 'Criar',
  'create.account.character.page.title': 'Criar personagem',
  'create.account.character.page.first.title': 'Informações do personagem',
  'create.account.character.page.first.subtitle':
      'Escolha seu nome e sua facção',
  'create.account.character.page.step.first.name': 'Nome do personagem',
  'create.account.character.page.step.first.faction': 'Facção',
  'create.account.character.page.step.two.title': 'Selecione um Personagem',
  'create.account.character.page.step.three.title': 'Finalizar',
  'create.account.character.page.step.three.row.first': 'Nome do personagem',
  'create.account.character.page.step.three.row.two': 'Personagem',
  'create.account.character.page.step.three.row.three': 'Facção',
  'create.account.character.page.button.next': 'Próximo',
  'create.account.character.page.button.complete': 'Concluir',
  'create.account.character.page.button.back': 'Voltar',
  'create.account.character.page.dialog.title': 'Criar um novo personagem',
  'create.account.character.page.dialog.content.first':
      'Você pode criar até 4 personagens.',
  'create.account.character.page.dialog.content.two':
      'Somente poderá criar personagens iniciais.',
  'create.account.character.page.dialog.content.three':
      'Escolha um nome e facção para criar seu primeiro personagem.',
  'create.account.character.page.dialog.content.four':
      'Você poderá trocar depois, o personagem, facção e nome.',
  'create.account.character.page.dialog.button': 'Fechar',
  'overview.page.title': 'Visão geral',
  'overview.page.premium.button': 'Premium',
  'overview.page.edit.button': 'Editar',
  'overview.page.faction': 'facção',
  'overview.page.no.crew': 'Nenhuma tripulação',
  'overview.page.crew': 'tripulação',
  'overview.page.bounty': 'recompensa',
  'overview.page.fame': 'fama',
  'overview.page.power': 'poder',
  'overview.page.discord.message':
      'Toque para acessar o grupo do discord do jogo. Venha-se divertir com a comunidade e tire suas dúvidas.',
  'overview.page.attributes': 'Atributos',
  'overview.page.attribute.punch': 'Soco',
  'overview.page.attribute.defense': 'Defesa',
  'overview.page.attribute.sword': 'Espada',
  'overview.page.attribute.weapon': 'Arma',
  'overview.page.attribute.fruit': 'Fruta',
  'overview.page.base.attribute': 'base',
  'overview.page.train.button': 'Treinar',
  'overview.page.statistics': 'Estatísticas',
  'overview.page.experience': 'Experiência',
  'overview.page.honor.win': 'Vitórias de honra',
  'overview.page.total.battle': 'Batalhas totais',
  'overview.page.win': 'Vitórias',
  'overview.page.defeat': 'Derrotas',
  'overview.page.draw': 'Empates',
  'overview.page.damage.hit': 'Dano causado',
  'overview.page.damage.taken': 'Dano sofrido',
  'overview.page.belly.won': 'Belly conquistado',
  'overview.page.belly.lost': 'Belly perdido',
  'overview.page.score': 'Pontos',
  'overview.page.biography': 'Biografia',
  'overview.page.no.biography': 'Nenhuma biografia',
  'overview.page.enter.biography':
      'Insira uma breve biografia para aparecer em seu perfil',
  'overview.page.biography.save.button': 'Salvar',
  'overview.validation.field.biography.length':
      'A biografia deve conter no mínimo 10 caracteres e no máximo 200 caracteres',
};

final Map<String, String> esES = {
  'side.bar.game.time': 'tiempo de juego',
  'side.bar.immunity': 'immunity',
  'side.bar.no.immunity': 'Vulnerable',
  'side.bar.menu.overview.title': 'Visión general',
  'side.bar.menu.overview.subtitle':
      'Esta es la descripción general de los datos de tu personaje',
  'side.bar.menu.change.character.title': 'Cambia de carácter',
  'side.bar.menu.change.character.subtitle':
      'Cambiar entre personajes en su cuenta',
  'side.bar.menu.logout.title': 'Cerrar sesión',
  'side.bar.menu.logout.subtitle':
      'Sal de tu cuenta para volver a iniciar sesión',
  'dialog.confirmation.title': '¡Aviso!',
  'dialog.confirmation.cancel.button': 'Cancelar',
  'dialog.confirmation.confirm.button': 'Confirmar',
  'dialog.confirmation.content':
      '¿Quieres confirmar tu acción? no será posible revertir',
  'faction.pirate': 'Pirata',
  'faction.marine': 'Marinero',
  'faction.revolutionary': 'Revolucionario',
  'gender.male': 'Masculino',
  'gender.female': 'Femenino',
  'gender.other': 'Otro',
  'landing.page.connection': 'Conectando al servidor...',
  'landing.page.version':
      'Hay una nueva actualización disponible, actualice la aplicación en su tienda.',
  'landing.page.start': 'Preparándonos para empezar...',
  'landing.page.try.connect.button': 'Intentar nuevamente',
  'connection.failure': 'Error al conectar con el servidor',
  'connection.login.button': 'Iniciar sesión',
  'validation.field.empty': 'Por favor este campo debe ser llenado',
  'validation.field.email': 'Por favor, escriba un correo electrónico válido',
  'validation.field.password.confirmation':
      'Las contraseñas deben ser las mismas',
  'validation.field.password.length':
      'La contraseña debe contener al menos 6 caracteres',
  'validation.field.name':
      'El nombre puede contener letras, números y caracteres de subrayado separando cada letra, el primer y último carácter deben ser alfanuméricos',
  'validation.field.name.length':
      'El nombre debe contener un mínimo de 3 caracteres y un máximo de 20 caracteres',
  'login.page.title': 'Acceso',
  'login.page.button': 'Jugar ahora',
  'login.page.email': 'Correo electrónico',
  'login.page.password': 'Contraseña',
  'login.page.have.registration': '¿No tienes un registro?',
  'login.page.register.button': 'Registro',
  'register.page.title': 'Registro',
  'register.page.email': 'Correo electrónico',
  'register.page.password': 'Contraseña',
  'register.page.password.confirmation': 'Confirmar la contraseña',
  'register.page.gender': 'Género',
  'register.page.birth.date': 'Fecha de nacimiento',
  'register.page.button': 'Registro',
  'register.page.service.terms.text': 'Al crear una cuenta, acepta leer todo ',
  'register.page.service.terms.action': 'Términos del servicio',
  'account.character.page.title': 'Personajes',
  'account.character.page.play.button': 'Jugar',
  'account.character.page.create.button': 'Crear',
  'create.account.character.page.title': 'Crear personaje',
  'create.account.character.page.first.title': 'Información del personaje',
  'create.account.character.page.first.subtitle':
      'Elige tu nombre y tu facción',
  'create.account.character.page.step.first.name': 'Nombre del personaje',
  'create.account.character.page.step.first.faction': 'Facción',
  'create.account.character.page.step.two.title': 'Selecciona un personaje',
  'create.account.character.page.step.three.title': 'Finalizar',
  'create.account.character.page.step.three.row.first': 'Nombre del personaje',
  'create.account.character.page.step.three.row.two': 'Personaje',
  'create.account.character.page.step.three.row.three': 'Facción',
  'create.account.character.page.button.next': 'Próximo',
  'create.account.character.page.button.complete': 'Concluir',
  'create.account.character.page.button.back': 'Regresar',
  'create.account.character.page.dialog.title': 'Crear un nuevo personaje',
  'create.account.character.page.dialog.content.first':
      'Puedes crear hasta 4 personajes.',
  'create.account.character.page.dialog.content.two':
      'Solo puedes crear personajes iniciales.',
  'create.account.character.page.dialog.content.three':
      'Elige un nombre y una facción para crear tu primer personaje.',
  'create.account.character.page.dialog.content.four':
      'Más tarde puedes cambiar el personaje, la facción y el nombre.',
  'create.account.character.page.dialog.button': 'Cerca',
  'overview.page.title': 'Visión general',
  'overview.page.premium.button': 'Premium',
  'overview.page.edit.button': 'Editar',
  'overview.page.faction': 'facción',
  'overview.page.no.crew': 'Sin tripulación',
  'overview.page.crew': 'tripulación',
  'overview.page.bounty': 'recompensa',
  'overview.page.fame': 'fama',
  'overview.page.power': 'poder',
  'overview.page.discord.message':
      'Toca para unirte al grupo de discordia del juego. Ven a divertirte con la comunidad y haz tus preguntas.',
  'overview.page.attributes': 'Atributos',
  'overview.page.attribute.punch': 'Puñetazo',
  'overview.page.attribute.defense': 'Defensa',
  'overview.page.attribute.sword': 'Espada',
  'overview.page.attribute.weapon': 'Arma',
  'overview.page.attribute.fruit': 'Fruta',
  'overview.page.base.attribute': 'base',
  'overview.page.train.button': 'Entrenar',
  'overview.page.statistics': 'Estadísticas',
  'overview.page.experience': 'Experiencia',
  'overview.page.honor.win': 'Victorias de honor',
  'overview.page.total.battle': 'Batallas totales',
  'overview.page.win': 'Victorias',
  'overview.page.defeat': 'Derrotas',
  'overview.page.draw': 'Sorteos',
  'overview.page.damage.hit': 'Daño causado',
  'overview.page.damage.taken': 'Daño sufrido',
  'overview.page.belly.won': 'Belly conquistado',
  'overview.page.belly.lost': 'Belly perdido',
  'overview.page.score': 'Puntos',
  'overview.page.biography': 'Biografía',
  'overview.page.no.biography': 'Sin biografia',
  'overview.page.enter.biography':
      'Introduce una breve biografía para que aparezca en tu perfil.',
  'overview.page.biography.save.button': 'Guardar',
  'overview.validation.field.biography.length':
      'La biografía debe contener un mínimo de 10 caracteres y un máximo de 200 caracteres',
};
