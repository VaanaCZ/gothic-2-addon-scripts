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
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //Alles klar bei dir?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //Was ist los? Schickt Henry dich zu mir?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Kannst ihm sagen, er bekommt seine Bretter sobald ich fertig bin.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //Wenn ihm das nicht passt, kann er sie auch gerne selber s�gen.
	
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

	description = "Was machst du mit den Brettern?";
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
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //Was machst du mit den Brettern?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //Die sind f�r die Palisade, du Depp!
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg hielt es f�r 'ne gute Idee, unser Lager damit zu sichern.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Also, wenn du mich fragst, k�nnen wir uns die Arbeit sparen.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Falls die Banditen wirklich vorhaben uns anzugreifen, wird sie auch die l�cherliche Palisade nicht aufhalten.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //Wir h�tten sie niemals in unserem Tal dulden d�rfen.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Wenn ich das alles vorher gewusst h�tte, dann w�re ich in Khorinis geblieben.
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
	description	= "Kann ich dir beim S�gen helfen?";
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
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //Kann ich dir beim S�gen helfen?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Lass nur, ich schaff' das schon.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //Ich bin noch nicht so lange dabei, und wenn ich andere meine Arbeit machen lasse, komme ich hier nicht weit, verstehst du?
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
	description	= "Was machst du jetzt?";
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
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //Was machst du jetzt?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //Ich mach erst mal Pause.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //(schadenfroh) Francis hat meinen alten Job gekriegt.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Von mir aus soll er Bretter s�gen bis er schwarz wird.
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
	description = "Ich suche Angus und Hank.";
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
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_00"); //Ich suche Angus und Hank.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //(seufzt) Ich habe keine Ahnung, wo sie sind - wahrscheinlich wurden sie von den Banditen erwischt.
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Ihr wart doch befreundet, oder nicht?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //Alles, was ich wei� ist, da� sie sich in einer H�hle hier in der N�he mit den Banditen treffen wollten.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //Sie muss irgendwo ausserhalb unseres Lagers im Osten sein. 
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //Wo genau, wei� ich nicht. Ich bin selbst nie da gewesen.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Am besten du fragst Alligator Jack mal danach. Der treibt sich doch st�ndig vorm Lager herum.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus und Hank hatten �stlich des Lagers eine H�hle. Alligator Jack k�nnte mehr dar�ber wissen.");
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
	description = "Ich habe deine Freunde gefunden.";
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
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //Ich habe deine Freunde gefunden.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //Und? Wo sind sie?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Sie sind tot.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //(Hass) Das waren diese verfluchten Banditen!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //M�glich.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Diese verdammten Mistkerle. Der Teufel soll sie holen.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //(zu sich, Hass) Ich w��te zu gerne den Namen des Kerls, der das getan hat...
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Bill war v�llig fertig, als ich ihm von Angus und Hanks Tod unterrichtet haben. Er will den Namen des M�rders.");
};	

// ------------------------------------------------------------
// 						Ich kenne den M�rder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "Ich kenne den M�rder von Angus und Hank.";
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
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //Ich kenne den M�rder von Angus und Hank.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //(aufgeregt) Wer? Wer war es?
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //Der Kerl hei�t Juan und ist einer der Banditen.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //Du musst das Schwein erledigen, h�rst du?
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //Er darf nicht mit der Sache ungeschoren davonkommen!
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Ich soll Juan t�ten. Als Rache f�r Angus und Hank");
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

	description = "Juan ist erledigt.";
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
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //Juan ist erledigt.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //(eifrig) Und? Hat er gelitten?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Mach mal halblang.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //(seufzt) Schon gut. Hauptsache du hast das Schwein fertiggemacht.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan ist erledigt. Bill war zeimlich zufrieden.");
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

	description	= "Du warst in Khorinis?";
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
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //Du warst in Khorinis?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Ja, ich hab mich da mit Taschendiebst�hlen und kleinen Gaunereien �ber Wasser gehalten.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Aber als immer weniger Schiffe kamen, gingen die Gesch�fte immer schlechter.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //Irgendwann hatte ich keine Lust mehr f�r eine paar Brotkrumen vor der Miliz wegzulaufen.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //Ich habe mich dann Greg angeschlossen. Jetzt sitze ich hier fest.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //(seufzt) Den ganzen Tag am S�gen, um eine Palisade zu bauen, die sowieso keinem was bringt.
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
	
	description	= "Kannst du mir was beibringen?";
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
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //Kannst du mir was beibringen?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //Nun, ich k�nnte dir zeigen, wie man anderer Leute Taschen pl�ndert, ohne das sie etwas merken.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Aber du solltest einigermassen geschickt sein, sonst kannst du's vergessen.

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
	description	= "Zeig mir den Taschendiebstahl. (10 LP)";
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
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Zeig mir den Taschendiebstahl.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man f�r Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //Wenn du jemanden beklauen m�chtest, musst du dein Opfer in Sicherheit wiegen.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //Ich habe die Leute immer angequatscht. Das funktioniert pr�chtig.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //Wenn du zugreifst, dann sei dir sicher, dass dein Gegen�ber nichts merkt.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //Sonst noch was?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Ja, trainiere deine Geschicklichkeit. Je geschickter du bist, desto besser erkennst du eine gute Gelegenheit.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //Und desto eher kannst du deinem Opfer seine Sachen abnehmen, ohne dabei ERWISCHT zu werden!
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //Das ist alles, zumindest in der Theorie.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Vergi� es! Du bist nicht geschickt genug!
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Du mu�t entweder geschickter werden oder dir 'nen besseren Lehrer suchen.
	};
};

