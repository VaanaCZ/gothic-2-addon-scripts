// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bill_EXIT(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 999;
	condition	= DIA_Addon_Bill_EXIT_Condition;
	information	= DIA_Addon_Bill_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Bill_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bill_PICKPOCKET (C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 900;
	condition	= DIA_Addon_Bill_PICKPOCKET_Condition;
	information	= DIA_Addon_Bill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bill_PICKPOCKET_Condition()
{
	C_Beklauen (80, 205);
};
 
FUNC VOID DIA_Addon_Bill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
	
func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello
// ************************************************************
INSTANCE DIA_Addon_Bill_Hello(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 1;
	condition	= DIA_Addon_Bill_Hello_Condition;
	information	= DIA_Addon_Bill_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Bill_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Bill_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //¿Qué tal te va a ti todo?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //¿Qué pasa? ¿te ha enviado Henry?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Dile que conseguiré sus tablas en cuanto termine lo mío.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //Si no puede esperar, que se ponga a serrar él mismo.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  				 Planks
// ************************************************************
INSTANCE DIA_Addon_Bill_Planks(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 2;
	condition	= DIA_Addon_Bill_Planks_Condition;
	information	= DIA_Addon_Bill_Planks_Info;

	description = "¿Para qué son esas tablas?";
};                       
FUNC INT DIA_Addon_Bill_Planks_Condition()
{
	if (GregIsBAck == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Bill_Planks_Info()
{	
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //¿Para qué son esas tablas?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //Para construir la empalizada, memo.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg pensó que sería una buena forma de proteger el campamento.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Yo creo que podríamos ahorrarnos la molestia.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Si los bandidos planean atacarnos de verdad, esa ridícula empalizada no va a detenerlos.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //No deberíamos haberlos admitido en nuestro valle, para empezar.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Si hubiera sabido todo esto antes, me hubiera quedado en Khorinis.
};
	
// ************************************************************
// 							PERM
// ************************************************************
var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 4;
	condition	= DIA_Addon_Bill_Perm_Condition;
	information	= DIA_Addon_Bill_Perm_Info;
	permanent	= TRUE;
	description	= "¿Puedo ayudarte a serrar?";
};
func int DIA_Addon_Bill_Perm_Condition ()
{
	if (GregIsBack == FALSE)
	&& (Npc_WasInState (self, ZS_Saw))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //¿Puedo ayudarte a serrar?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Nah, ya puedo yo solo.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //Vine no hace mucho y si dejo que los demás hagan mi trabajo, no llegaré lejos, ya me entiendes.
		Bill_Perm_Once = TRUE;
	};
};

// ************************************************************
//							PERM 2
// ************************************************************
instance DIA_Addon_Bill_Perm2		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 5;
	condition	= DIA_Addon_Bill_Perm2_Condition;
	information	= DIA_Addon_Bill_Perm2_Info;
	permanent	= TRUE;
	description	= "¿Qué haces ahora?";
};
func int DIA_Addon_Bill_Perm2_Condition ()
{
	if (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //¿Qué haces ahora?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //Me estoy tomando un descanso.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //(recreándose) Francis tiene ahora mi antiguo puesto.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Que sierre tablas hasta quedarse sin brazos.
	};
};



// ************************************************************
// ***														***
// 					Die Angus und Hank Show
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 					Ich suche Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_AngusnHank(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 11;
	condition	= DIA_Addon_Bill_AngusnHank_Condition;
	information	= DIA_Addon_Bill_AngusnHank_Info;
	permanent	= FALSE;
	description = "Estoy buscando a Angus y Hank.";
};                       
FUNC INT DIA_Addon_Bill_AngusnHank_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHank))
	&&  Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bill_AngusnHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_00"); //Estoy buscando a Angus y Hank.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //(suspira) No tengo ni idea de dónde andarán, los bandidos deben de haberlos atrapado.
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Erais amigos suyos, ¿verdad?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //Lo único que sé es que iban a reunirse con unos bandidos en una cueva cerca de aquí.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //Debe de ser saliendo de nuestro campamento, hacia el este. 
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //No sé dónde exactamente. Yo nunca he ido.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Tal vez deberías preguntarle a Caimán Jack. Siempre anda rondando fuera del campamento.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus y Hank tenían una cueva al este del campamento. Puede que Caimán Jack sepa más.");
};

// ------------------------------------------------------------
// 							Sie sind tot.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_FoundFriends(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 12;
	condition	= DIA_Addon_Bill_FoundFriends_Condition;
	information	= DIA_Addon_Bill_FoundFriends_Info;
	permanent	= FALSE;
	description = "He encontrado a tus amigos.";
};                       
FUNC INT DIA_Addon_Bill_FoundFriends_Condition()
{
	if (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_FoundFriends_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //He encontrado a tus amigos.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //¿Y? ¿Dónde están?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Están muertos.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //(con odio) ¡Han sido esos malditos bandidos!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //Es posible.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Esos malditos cerdos. Así ardan en el infierno.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //(para sí, con odio) Si supiera el nombre del gusano que ha hecho esto
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Bill se quedó destrozado cuando le dije que Angus y Hank habían muerto. Quiere saber quién es el responsable.");
};	

// ------------------------------------------------------------
// 						Ich kenne den Mörder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "Yo sé quién mató a Angus y a Hank.";
};
func int DIA_Addon_Bill_JuanMurder_Condition ()
{
	if (MIS_Addon_Bill_SearchAngusMurder == LOG_RUNNING)
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_JuanMurder_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //Yo sé quién mató a Angus y a Hank.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //(nervioso) ¿Quién? ¿Quién lo hizo?
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //Se llama Juan, es uno de los bandidos.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //Tienes que acabar con ese malnacido, ¿me oyes?
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //No puede quedar impune.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Tengo que matar a Juan, en venganza por Angus y Hank.");
};

// ------------------------------------------------------------
// 						Juan ist erledigt.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_KilledEsteban(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 14;
	condition	= DIA_Addon_Bill_KilledEsteban_Condition;
	information	= DIA_Addon_Bill_KilledEsteban_Info;

	description = "Juan es historia.";
};                       
FUNC INT DIA_Addon_Bill_KilledEsteban_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_JuanMurder))
	&& (Npc_IsDead (Juan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_KilledEsteban_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //Juan es historia.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //(entusiasmado) ¿Y? ¿Ha sufrido?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //¡Venga, hombre!
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //(suspira) En fin, mientras hayas matado a ese cerdo.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan está acabado. Bill estaba satisfecho.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Bill_KillAngusMurder);
	
};



// ************************************************************
// ***														***
//							Pick Pocket
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 							Khorinis?
// ------------------------------------------------------------
instance DIA_Addon_Bill_Khorinis		(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr		 	= 21;
	condition	= DIA_Addon_Bill_Khorinis_Condition;
	information	= DIA_Addon_Bill_Khorinis_Info;

	description	= "¿Has estado en Khorinis?";
};
func int DIA_Addon_Bill_Khorinis_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //¿Has estado en Khorinis?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Sí, conseguí subsistir robando a la gente y organizando alguna que otra  de estafas.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Pero como cada vez venían menos barcos, los negocios iban de mal en peor.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //Llegó un momento en que me harté de estar a las órdenes de la milicia por un poco de pan.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //Y entonces me uní a Greg. Y ahora aquí estoy.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //(suspira) Serrando todo el día para levantar una empalizada totalmente inútil.
	};
};

// ------------------------------------------------------------
// 							Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Bill_TeachPlayer		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 22;
	condition	= DIA_Addon_Bill_TeachPlayer_Condition;
	information	= DIA_Addon_Bill_TeachPlayer_Info;
	
	description	= "¿Puedes enseñarme algo?";
};
func int DIA_Addon_Bill_TeachPlayer_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_TeachPlayer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //¿Puedes enseñarme algo?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //Pues puedo enseñarte a robar carteras sin que nadie se dé cuenta.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Pero tienes que ser muy diestro o ya puedes olvidarte.

	Bill_Addon_TeachPickPocket = TRUE;
};

// ------------------------------------------------------------
// 						Teach Pickpocket
// ------------------------------------------------------------
instance DIA_Addon_Bill_LearnTalent		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 23;
	condition	= DIA_Addon_Bill_LearnTalent_Condition;
	information	= DIA_Addon_Bill_LearnTalent_Info;
	permanent 	= TRUE;
	description	= "Enséñame a robar a la gente. (10 PA)";
};
func int DIA_Addon_Bill_LearnTalent_Condition ()
{
	if (Bill_Addon_TeachPickPocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_LearnTalent_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Enséñame a robar carteras.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man für Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //Primero, tienes que conseguir que tu víctima se sienta totalmente segura.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //Yo me acercaba a la gente y me ponía a charlar. Eso funcionaba a las mil maravillas.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //Luego les intentas robar, pero con cuidado de que no se dieran cuenta.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //¿Algo más?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Sí, sigue entrenando tu destreza. Cuanto más diestro seas, más posibilidades de éxito tendrás.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //¡Y antes podrás dejar limpia a tu víctima sin que te PESQUEN!
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //Eso es todo. En teoría, al menos.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //¡Olvídalo! ¡No eres lo bastante ágil!
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Antes tendrás que conseguir ser más diestro o encontrar un profesor mejor.
	};
};

