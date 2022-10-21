///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro;
	nr          = 999;
	condition   = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_WELCOME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 =  1;
	condition	 = 	DIA_Pedro_WELCOME_Condition;
	information	 = 	DIA_Pedro_WELCOME_Info;
	important	 = 	TRUE;
};
func int DIA_Pedro_WELCOME_Condition ()
{
	return TRUE;
};
func void DIA_Pedro_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_00"); //Willkommen beim Kloster Innos', Fremder.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_01"); //Ich bin Bruder Pedro, ein demütiger Diener Innos' und Wächter der Pforte des heiligen Klosters.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_02"); //Was ist dein Begehr?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Pedro_Wurst(C_INFO)
{
	npc         = NOV_600_Pedro;
	nr			= 2;
	condition	= DIA_Pedro_Wurst_Condition;
	information	= DIA_Pedro_Wurst_Info;
	permanent	= FALSE;
	description = "Iß mal 'ne Wurst, Bruder!";
};                       

FUNC INT DIA_Pedro_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pedro_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Pedro_Wurst_15_00"); //Iß mal 'ne Wurst, Bruder!
	AI_Output (self, other, "DIA_Pedro_Wurst_09_01"); //Gut, dass du an mich gedacht hast. Meistens werde ich vergessen.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_02"); //Du kannst mir direkt mal noch eine Wurst hier lassen.
	AI_Output (other, self, "DIA_Pedro_Wurst_15_03"); //Vergiss es, dann habe ich nicht mehr genug.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_04"); //Hey, eine Wurst - das merkt kein Schwein. Du kriegst auch was dafür - ich weiß, wo ein paar Feuernesseln wachsen.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_05"); //Wenn du die Neoras bringst, kriegst du bestimmt den Schlüssel zur Bibliothek. Wie sieht's aus?
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Pedro_Wurst);
	Info_AddChoice (DIA_Pedro_Wurst,"Okay, nimm noch eine Wurst.",DIA_Pedro_Wurst_JA);
	Info_AddChoice (DIA_Pedro_Wurst,"Nein, vergiss es.",DIA_Pedro_Wurst_NEIN);
};
FUNC VOID DIA_Pedro_Wurst_JA()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_JA_15_00"); //Okay, nimm noch eine Wurst.
	AI_Output (self, other, "DIA_Pedro_Wurst_JA_09_01"); //Gut, auf der anderen Seite der Brücke wachsen links und rechts einige Feuernesseln.
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Info_ClearChoices (DIA_Pedro_Wurst);
	
};
FUNC VOID DIA_Pedro_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_NEIN_15_00"); //Nein, vergiss es.
	AI_Output (self, other, "DIA_Pedro_Wurst_NEIN_09_01"); //Du willst dich wohl bei Gorax beliebt machen, was? Immer das gleiche mit den neuen Novizen ...
	
	Info_ClearChoices (DIA_Pedro_Wurst);
};
///////////////////////////////////////////////////////////////////////
//	Info EINLASS
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_EINLASS		(C_INFO)
{
	npc			= 	NOV_600_Pedro;
	condition	= 	DIA_Pedro_EINLASS_Condition;
	information	= 	DIA_Pedro_EINLASS_Info;
	permanent	=	FALSE;
	description	= 	"Ich will ins Kloster";
};
func int DIA_Pedro_EINLASS_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Pedro_Welcome)
	{
		return TRUE;
	};
};
func void DIA_Pedro_EINLASS_Info ()
{
	AI_Output (other, self, "DIA_Pedro_EINLASS_15_00"); //Ich will ins Kloster.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_01"); //Es ist nur den Dienern Innos' gestattet, das Kloster zu betreten.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_02"); //Wenn du zu Innos beten willst, dann suche einen der Wegschreine auf. Dort wirst du Stille zum Gebet finden.
};
///////////////////////////////////////////////////////////////////////
//	Info TEMPEL
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_TEMPEL		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_TEMPEL_Condition;
	information	 = 	DIA_Pedro_TEMPEL_Info;
	permanent 	 =  FALSE;
	description	 = 	"Was muss ich tun, um im Kloster aufgenommen zu werden?";
};
//-----------------------------------

//-----------------------------------
func int DIA_Pedro_TEMPEL_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Pedro_EINLASS))
	&& (hero.guild != GIL_NOV)
	{	
		return TRUE;
	};	
};
func void DIA_Pedro_TEMPEL_Info ()
{	
 	AI_Output (other, self, "DIA_Pedro_TEMPEL_15_00"); //Was muss ich tun, um im Kloster aufgenommen zu werden?
 	
 	if (other.guild != GIL_NONE)
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_01"); //Die Aufnahme ins Kloster bleibt dir verwehrt - du hast dich bereits für einen Weg entschieden.
 	}
 	else
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_02"); //Wenn du in die Gemeinschaft Innos' aufgenommen werden willst, musst du die Regeln des Klosters kennen und befolgen.
		//AI_Output (self, other, "DIA_Pedro_TEMPEL_09_03"); //Außerdem verlangen wir von jedem neuen Novizen die Gaben an Innos. Ein Schaf und ...
		//B_Say_Gold (self, other, Summe_Kloster);  
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_03"); //Außerdem verlangen wir von jedem neuen Novizen die Gaben an Innos.
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_04"); //Ein Schaf und 1000 Goldstücke.
 		AI_Output (other, self, "DIA_Pedro_TEMPEL_15_04"); //Das ist verdammt viel Gold.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_05"); //Es ist ein Zeichen dafür, dass du ein neues Leben als Diener Innos' beginnst. Bei deiner Aufnahme werden dir alle deine bisherigen Verfehlungen vergeben.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_06"); //Und bedenke - die Entscheidung, ein Diener Innos' zu sein, kannst du nicht mehr rückgängig machen.
 		SC_KnowsKlosterTribut = TRUE;
  		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Um im Innos - Kloster als Novize aufgenommen zu werden, brauche ich ein Schaf und eine gewaltige Summe Gold.");
 	};
};

//*********************************************************************
//	ADDON Statuette
//*********************************************************************
instance DIA_Addon_Pedro_Statuette (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ich habe hier diese Statuette...";
};
func int DIA_Addon_Pedro_Statuette_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Pedro_Rules))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_00"); //Ich hab hier diese Statuette. Ich glaube, sie wird im Kloster vermisst.
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_01"); //Kann ich jetzt rein?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_02"); //Nun, unter diesen wahrlich besonderen Umständen steht es dir frei, Novize zu werden.

		Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Pedro, der Novize, lies mich ein ins Kloster, weil ich die vermisste Statuette bei mir trug. Ich sollte sie jemandem im Kloster übergeben."); 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_03"); //Ich fürchte, auch mit diesem kostbaren Kleinod kann ich dich nicht einlassen.
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_04"); //Du hast dich bereits für einen anderen Weg entschieden. Der Weg ins Kloster bleibt dir verwehrt.
	};
};

instance DIA_Addon_Pedro_Statuette_Abgeben (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kann ich die Statuette bei dir abgeben?";
};
func int DIA_Addon_Pedro_Statuette_Abgeben_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (Npc_KnowsInfo (other,DIA_Addon_Pedro_Statuette))
	&& (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_Abgeben_15_00"); //Kann ich die Statuette bei dir abgeben?
	AI_Output (self, other, "DIA_Addon_Pedro_Statuette_Abgeben_09_01"); //Natürlich, ich werde mich darum kümmern. Hab Dank für deine selbstlose Tat.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};
///////////////////////////////////////////////////////////////////////
//	Regeln
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_Rules		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_Rules_Condition;
	information	 = 	DIA_Pedro_Rules_Info;
	permanent	 = 	FALSE;
	description	 = 	"Welche Regeln habt ihr euch auferlegt?";
};
func int DIA_Pedro_Rules_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Pedro_Tempel)
	{
		return TRUE;
	};
};
func void DIA_Pedro_Rules_Info ()
{
	AI_Output (other, self,"DIA_Pedro_Rules_15_00"); //Welche Regeln habt ihr euch auferlegt?
	AI_Output (self, other,"DIA_Pedro_Rules_09_01"); //Innos ist der Gott der Wahrheit und des Gesetzes, daher dürfen wir NIEMALS lügen oder ein Verbrechen begehen.
	AI_Output (self, other,"DIA_Pedro_Rules_09_02"); //Solltest du dich an einem Bruder der Gemeinschaft oder an unserem Eigentum vergehen, so wirst du eine Strafe dafür bezahlen.
	AI_Output (self, other,"DIA_Pedro_Rules_09_03"); //Innos ist ebenso der Gott der Herrschaft und des Feuers.
	AI_Output (self, other,"DIA_Pedro_Rules_09_04"); //Als Novize hast du allen Magiern des Feuers GEHORSAM und RESPEKT entgegenzubringen.
	AI_Output (other,self ,"DIA_Pedro_Rules_15_05"); //Aha.
	AI_Output (self ,other,"DIA_Pedro_Rules_09_06"); //Ferner ist es die PFLICHT der Novizen, alle Arbeiten im Kloster zum Wohle der Gemeinschaft zu erledigen.
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Pedro_Rules_09_07"); //Wenn du bereit bist, diese Regeln zu befolgen und die Gaben an Innos hast, sind wir gewillt, dich als Novizen in unser Kloster aufzunehmen.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_AUFNAHME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	condition	 = 	DIA_Pedro_AUFNAHME_Condition;
	information	 = 	DIA_Pedro_AUFNAHME_Info;
	permanent 	 =  TRUE; 
	description	 = 	"Ich möchte Novize werden";
};
var int DIA_Pedro_AUFNAHME_NOPERM;
func int DIA_Pedro_AUFNAHME_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pedro_Rules)
	&& (DIA_Pedro_AUFNAHME_NOPERM == FALSE)
	{
		return TRUE;
	};
};
func void B_DIA_Pedro_AUFNAHME_Choice ()
{
		Info_ClearChoices (DIA_Pedro_AUFNAHME);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Ich denke nochmal darüber nach",DIA_Pedro_AUFNAHME_NO);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Ja, ich will mein Leben in den Dienst Innos stellen",DIA_Pedro_AUFNAHME_YES);
};
func void DIA_Pedro_AUFNAHME_Info ()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_15_00"); //Ich möchte Novize werden.
	
	Npc_PerceiveAll (self);
	
	if (hero.guild != GIL_NONE)
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_01"); //Du hast dich bereits für deinen Weg entschieden. Der Weg der Magie bleibt dir verschlossen.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	//ADDON>
	else if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
	{
		AI_Output (self, other, "DIA_Addon_Pedro_AUFNAHME_09_02"); //Ist das tatsächlich dein Wunsch? Denn wisse, dass es dann keinen Weg zurück mehr für dich gibt.
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	//<ADDON
	else if (hero.guild == GIL_NONE )
	&& (Npc_HasItems (hero, ItMi_Gold) >= Summe_Kloster)
	&& Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 1000)
	{
		
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_03"); //Ich sehe, du bringst die nötigen Gaben mit. Wenn du wirklich willst, steht es dir nun frei, Novize zu werden.
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_04"); //Doch wenn du diese Entscheidung triffst, gibt es kein Zurück mehr - überlege dir gut, ob dies dein Weg ist!
		
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	else
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_02"); //Du hast nicht die nötigen Gaben dabei.
	};
};

FUNC VOID DIA_Pedro_AUFNAHME_YES()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_00"); //Ja, ich will mein Leben in den Dienst Innos' stellen.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_01"); //Dann sei willkommen, Bruder. Ich übergebe dir nun den Schlüssel zur Pforte des Klosters.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_02"); //Als Zeichen deiner freien Entscheidung ist es an dir, die Pforte zu öffnen und hindurchzutreten.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_03"); //Du bist jetzt Novize. Trage diese Robe als Zeichen, dass du nun zur Gemeinschaft des Klosters gehörst.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_04"); //Wenn du im Kloster bist, wende dich an Parlan. Er wird sich von nun an um deine Belange kümmern.
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_05"); //Werden mir jetzt meine Verfehlungen vergeben?
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_06"); //Noch nicht. Sprich mit Meister Parlan. Er wird dich segnen und dich von deinen Sünden reinwaschen.
	
	CreateInvItems 		(self,ItKe_Innos_MIS,1);
	B_GiveInvItems 		(self, hero, ItKe_Innos_MIS,1); 
	
	CreateInvItems 		(other,ITAR_NOV_L,1);
	AI_EquipArmor		(other,ITAR_NOV_L);		   
	
	other.guild = GIL_NOV;
	Npc_SetTrueGuild (other, GIL_NOV);
	
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP (XP_AufnahmeNovize);
	
	//ADDON>
 	if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
 	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE; //Joly: nix mehr mit Liesel
	};
	//ADDON<
	
	Wld_AssignRoomToGuild ("Kloster02",GIL_KDF);
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pedro_AUFNAHME_NO()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_NO_15_00"); //Ich denke noch mal darüber nach.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_NO_09_01"); //Komm wieder, wenn du bereit bist.
	
	Info_ClearChoices (DIA_Pedro_AUFNAHME);
};
//*********************************************************************
//	Erzähl mir vom Leben im Kloster.
//*********************************************************************
instance DIA_Pedro_Monastery		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	90;
	condition	 = 	DIA_Pedro_Monastery_Condition;
	information	 = 	DIA_Pedro_Monastery_Info;
	permanent	 = 	TRUE;
	description	 = 	"Erzähl mir vom Leben im Kloster.";
};
func int DIA_Pedro_Monastery_Condition ()
{		
	return TRUE;
};
func void DIA_Pedro_Monastery_Info ()
{
	AI_Output (other, self, "DIA_Pedro_Monastery_15_00"); //Erzähl mir vom Leben im Kloster.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_01"); //Wir leben im Kloster, um Innos zu dienen. Wir Novizen verrichten die Arbeiten und wenn wir die Gelegenheit bekommen, studieren wir die Schriften.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_02"); //Die Magier wachen über uns und sie erforschen die Künste der Magie.
}; 




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pedro_PICKPOCKET (C_INFO)
{
	npc			= NOV_600_Pedro;
	nr			= 900;
	condition	= DIA_Pedro_PICKPOCKET_Condition;
	information	= DIA_Pedro_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Pedro_PICKPOCKET_Condition()
{
	C_Beklauen (45, 60);
};
 
FUNC VOID DIA_Pedro_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pedro_PICKPOCKET);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_BACK 		,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};
	
func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};















