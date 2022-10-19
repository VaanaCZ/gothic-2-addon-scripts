///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_EXIT   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 999;
	condition   = DIA_Girion_EXIT_Condition;
	information = DIA_Girion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Girion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Girion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_Hallo   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_Hallo_Condition;
	information = DIA_Girion_Hallo_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Girion_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (MIS_ShipIsFree == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Girion_Hallo_Info()
{
	AI_Output (self, other, "DIA_Girion_Hallo_08_00"); //Ich bin Girion, Meister des zweih�ndigen Kampfes und Paladin des K�nigs. Warum st�rst du mich?
};
///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_CanTeach		(C_INFO)
{
	npc			 = 	PAL_207_Girion;
	nr			 = 	5;
	condition	 = 	DIA_Girion_CanTeach_Condition;
	information	 = 	DIA_Girion_CanTeach_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Kannst du mich trainieren?";
};
func int DIA_Girion_CanTeach_Condition ()
{	
	if (Girion_Teach2H == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Girion_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Girion_CanTeach_15_00"); //Kannst du mich trainieren?
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Girion_CanTeach_08_01"); //Du tust gut daran, dich in dem edelsten aller Kampfstile zu �ben. So, wie es sich f�r einen Streiter Innos' geh�rt.
		AI_Output (self, other, "DIA_Girion_CanTeach_08_02"); //Ich werde dich ausbilden. Erstatte mir Bericht, wenn du bereit bist.
		
		Girion_Teach2H = TRUE;	
		B_LogEntry (TOPIC_CityTeacher,"Paladin Girion kann mich im Kampf mit Zweih�ndern unterweisen.");
	}
	else
	{
		AI_Output (self, other, "DIA_Girion_CanTeach_08_03"); //Wenn du etwas lernen willst, musst du dich schon an einen Lehrer au�erhalb unseres Ordens wenden.
		AI_Output (self, other, "DIA_Girion_CanTeach_08_04"); //Ich bin ein Krieger, kein Lehrer.
	};
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Girion_Teach(C_INFO)
{
	npc			= PAL_207_Girion;
	nr			= 100;
	condition	= DIA_Girion_Teach_Condition;
	information	= DIA_Girion_Teach_Info;
	permanent	= TRUE;
	description = "Ich bin bereit f�r das Training.";
};                       
//----------------------------------
var int DIA_Girion_Teach_permanent;
//----------------------------------
FUNC INT DIA_Girion_Teach_Condition()
{
	if (Girion_Teach2H == TRUE)
	&& (DIA_Girion_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
// -------------------------------
var int  girion_merk2h;
// ------------------------------- 
FUNC VOID DIA_Girion_Teach_Info()
{	
	girion_merk2h = other.HitChance[NPC_TALENT_2H];  
	
	AI_Output (other,self ,"DIA_Girion_Teach_15_00"); //Ich bin bereit f�r das Training.
	
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);

};
FUNC VOID DIA_Girion_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_00"); //Deine Ausbildung ist nat�rlich noch nicht abgeschlossen, doch ich kann dir nichts mehr beibringen.
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_01"); //Wenn du dein K�nnen mit der Waffe noch weiter verbessern willst, musst du einen echten Schwertmeister aufsuchen.
		AI_Output (other,self,"DIA_DIA_Girion_Teach_15_02"); //Wo finde ich einen solchen Mann?
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_03"); //Lord Hagen ist ein Schwertmeister. Er wird dich gewiss unterrichten.
		
		DIA_Girion_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Girion_Teach);
};

FUNC VOID DIA_Girion_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);
	
	if (other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if (Girion_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_00"); //K�mpfe mit Ehre. Der Kampf ist unser Leben - was ist dein Leben ohne Ehre?
		};
		if (Girion_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_01"); //Handle im Kampf umsichtig und schnell. �berrasche deinen Gegner.
		};
		if (Girion_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_02"); //Gehe niemals unvorbereitet in den Kampf. Du kannst nie wissen, ob es nicht dein letzter ist.
		};
		if (Girion_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_03"); //Ein Paladin ist immer bereit f�r den Kampf. Aber er beginnt keinen Kampf, den er nicht gewinnen kann.
		};
		
		Girion_Labercount = Girion_Labercount +1;
		if (Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;	
		};
	};
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);	
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);	
};

FUNC VOID DIA_Girion_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
	
	if (other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if (Girion_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_00"); //Ein Paladin k�mpft nicht nur mit dem Schwert, sondern auch mit dem Verstand.
		};
		if (Girion_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_01"); //Du musst den Punkt kennen, bis zu dem du zur�ckweichen darfst.
		};
		if (Girion_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_02"); //Bedenke, du k�mpfst gut, wenn du den Gegner steuerst und ihm keine M�glichkeit gibst, sich selbst zu steuern.
		};
		if (Girion_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_03"); //Verloren hast du erst dann, wenn du aufgegeben hast.
		};
		
		Girion_Labercount = Girion_Labercount +1;
		if (Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;	
		};
	};
	
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);	
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);	
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info CatchPlayerStolenShip
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_CATCHPLAYERSTOLENSHIP		(C_INFO)
{
	npc		 = 	PAL_207_Girion;
	nr		 = 	5;
	condition	 = 	DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition;
	information	 = 	DIA_Girion_CATCHPLAYERSTOLENSHIP_Info;
	important	 = 	TRUE;
};

func int DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition ()
{
	if (Kapitel >= 5)
	&& (MIS_ShipIsFree == TRUE) 
	&& (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25")<1000) //Joly: ist nur hier, wenn SC die Wachen �berredet hat, ihm das Schiff zu geben.
	{
		return TRUE;
	};
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_Info ()
{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00"); //Hey! Kannst du mir mal verraten, was du hier treibst?

	Info_ClearChoices	(DIA_Girion_CATCHPLAYERSTOLENSHIP);
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "Ich wei� nicht, wovon du redest.", DIA_Girion_CATCHPLAYERSTOLENSHIP_no );
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "Geh mir aus dem Weg, sonst mu� ich dich t�ten.", DIA_Girion_CATCHPLAYERSTOLENSHIP_weg );
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "Ich brauche das Schiff.", DIA_Girion_CATCHPLAYERSTOLENSHIP_ship );

};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_no ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00"); //Ich wei� nicht, wovon du redest.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01"); //Ich rede davon, was du mit den Schiffswachen da oben ausgehandelt hast. Das stinkt doch zum Himmel.

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02"); //Auch wenn du ein Magier bist, ich traue dir trotzdem nicht.
	};
};
var int Girion_WantstoKillSC;
func void DIA_Girion_CATCHPLAYERSTOLENSHIP_weg ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00"); //Geh mir aus dem Weg, sonst muss ich dich t�ten.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01"); //Du kannst vielleicht die Schiffswachen t�uschen, aber an mir wirst du dir die Z�hne ausbei�en, mein Freundchen.
	if (hero.guild == GIL_PAL)
	{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02"); //Auch wenn du zu uns geh�rst, gibt dir das noch lange nicht das Recht, das Eigentum des K�nigs zu stehlen. Stirb, du verdammter Verr�ter.
	};
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Girion_WantstoKillSC = TRUE;
};

func void B_GirionStayOnShip()
{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09"); //Wenn wir die Sache erledigt haben, wirst du mir das Schiff wieder �bergeben, klar?
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_ship ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00"); //Ich brauche das Schiff. Also werde ich es mir nehmen.
	
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01"); //Das kannst du nicht tun. Der Erztransport ...
	}
	else
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02"); //Wie kannst du es wagen, du stinkender Abfall von einem ...
	};
	
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03"); //Das Erz im Minental wird nicht reichen, um den K�nig zufrieden zu stellen. Ich war dort. Da ist nichts mehr zu holen. Hagens Mission ist eine Farce.
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04"); //Die eigentliche Bedrohung hat ihre Wurzeln auf einer vorgelegenen Insel nicht weit von hier. Ich werde dorthin segeln und sie beenden.
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05"); //Entweder, du schlie�t dich mir an, oder ich muss dich aus dem Weg r�umen. Du hast die Wahl.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06"); //Mmh. H�rt sich an, als h�tte ich keine Wahl.
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07"); //Richtig.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08"); //Nun gut. Ich werde mich dir anschlie�en, aber nur unter einer Bedingung.

	B_GirionStayOnShip();

	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10"); //Damit kann ich leben.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11"); //Dann tu, was du tun musst. Ich werde hier auf dich warten.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	crewmember_Count = (Crewmember_Count +1);
	Girion_IsOnBoard = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Verrat 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_Verrat   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_Verrat_Condition;
	information = DIA_Girion_Verrat_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

FUNC INT DIA_Girion_Verrat_Condition()
{
	if (Girion_WantstoKillSC == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Girion_Verrat_Info()
{
	AI_Output			(self, other, "DIA_Girion_Verrat_08_00"); //Verr�ter!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};


///////////////////////////////////////////////////////////////////////
//	Info OnShip 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_OnShip   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_OnShip_Condition;
	information = DIA_Girion_OnShip_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

FUNC INT DIA_Girion_OnShip_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Girion_IsOnBoard == LOG_SUCCESS)
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Girion_OnShip_Info()
{
	B_GirionStayOnShip();
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Girion_PICKPOCKET (C_INFO)
{
	npc			= PAL_207_Girion;
	nr			= 900;
	condition	= DIA_Girion_PICKPOCKET_Condition;
	information	= DIA_Girion_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Girion_PICKPOCKET_Condition()
{
	C_Beklauen (73, 280);
};
 
FUNC VOID DIA_Girion_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Girion_PICKPOCKET);
	Info_AddChoice		(DIA_Girion_PICKPOCKET, DIALOG_BACK 		,DIA_Girion_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Girion_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Girion_PICKPOCKET_DoIt);
};

func void DIA_Girion_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Girion_PICKPOCKET);
};
	
func void DIA_Girion_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Girion_PICKPOCKET);
};



