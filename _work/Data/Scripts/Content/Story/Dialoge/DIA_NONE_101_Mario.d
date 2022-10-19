
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_None_101_Mario_EXIT   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 999;
	condition   = DIA_None_101_Mario_EXIT_Condition;
	information = DIA_None_101_Mario_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Was machst du hier? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_Job (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 4;
	condition   = DIA_None_101_Mario_Job_Condition;
	information = DIA_None_101_Mario_Job_Info;
	permanent   = TRUE;
	description	= "Co tady d�l�?";
};

FUNC INT DIA_None_101_Mario_Job_Condition()
{
	if (Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == FALSE)
	&& (Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe)== FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_Job_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_Job_15_00"); //Co tady d�l�?
	AI_Output (self ,other,"DIA_None_101_Mario_Job_07_01"); //Douf�m, �e co nejd��v p�ipluje lo�, kterou bych si mohl pronajmout.
	AI_Output (self ,other,"DIA_None_101_Mario_Job_07_02"); //Tohle fl�k�n� mi u� v�n� leze na nervy.
};

//*********************************************************************
//	Du suchst doch Leute? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_YouNeedMe   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 4;
	condition   = DIA_None_101_Mario_YouNeedMe_Condition;
	information = DIA_None_101_Mario_YouNeedMe_Info;
	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_None_101_Mario_YouNeedMe_Condition()
{
	if (Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output (self ,other,"DIA_None_101_Mario_YouNeedMe_07_00"); //Sly�el jsem, �e hled� lidi na svou lo�?
	AI_Output (other,self ,"DIA_None_101_Mario_YouNeedMe_15_01"); //A?
	AI_Output (self ,other,"DIA_None_101_Mario_YouNeedMe_07_02"); //Jdu do toho!
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	
	B_LogEntry (TOPIC_Crew,"V p��stavn� kr�m� se se mnou dal do �e�i b�val� n�mo�n�k Mario, kter� se chce op�t dostat na lo�.");
};

//*********************************************************************
//	Warum sollte ich dich mitnehmen? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_WhyNeedYou   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 5;
	condition   = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent   = FALSE;
	description	= "Pro� bych t� m�l s sebou br�t?";
};

FUNC INT DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_WhyNeedYou_15_00"); //Pro� bych t� m�l s sebou br�t?
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_01"); //Prost� proto, �e m� pot�ebuje�.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_02"); //Jsem... byl jsem poru��kem v kr�lovsk�m n�mo�nictvu.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_03"); //Slou�il jsem jako n�mo�n�k na Kr�li Rhobarovi a Chloub� Myrtany.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_04"); //V bitv� o V�chodn� souostrov� jsem jednou rukou poslal zp�tky do Beliarovy ��e dva tucty sk�et�.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_05"); //Bohu�el pot�, co potopili na�i vlajkovou lo�, n�s zbylo p��li� m�lo a museli jsme se st�hnout.

};

//*********************************************************************
//	Wieso bist du dann hier? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_WhyHere   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 7;
	condition   = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent   = FALSE;
	description	= "Tak pro� jsi tady?";
};

FUNC INT DIA_None_101_Mario_WhyHere_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_WhyNeedYou))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_WhyHere_15_00"); //Tak pro� jsi tady?
	AI_Output (self ,other,"DIA_None_101_Mario_WhyHere_07_01"); //Flotila je rozpr�en� a truhlice se �oldem pr�zdn�.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyHere_07_02"); //Kdy� m� propustili, z�stal jsem tr�et v t�hle d��e. Tak hled�m n�jakou dal�� pr�ci.
};

//*********************************************************************
//	Was kannst du?
//*********************************************************************
INSTANCE DIA_None_101_Mario_Abilities   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 8;
	condition   = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent   = FALSE;
	description	= "Co um�?";
};

FUNC INT DIA_None_101_Mario_Abilities_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_WhyNeedYou))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_Abilities_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_Abilities_15_00"); //Co um�?
	AI_Output (self ,other,"DIA_None_101_Mario_Abilities_07_01"); //Jsem zku�en� n�mo�n�k a bojovn�k, nav�c dok�u slu�n� zach�zet s lodn�m d�lem.
	AI_Output (self ,other,"DIA_None_101_Mario_Abilities_07_02"); //Ur�it� bych t� p�r v�c� dok�zal nau�it, ne� doplujeme k c�li.

	B_LogEntry (TOPIC_Crew,"Vypad� to, �e Mario je ve v�cech n�mo�n�ch docela zb�hl�. Mo�n� by se se mnou mohl o p�r zku�enost� pod�lit.");
};

//*********************************************************************
//	Was verlangst du?
//*********************************************************************
INSTANCE DIA_None_101_Mario_YourPrice   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 9;
	condition   = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent   = FALSE;
	description	= "Co za to chce�?";
};

FUNC INT DIA_None_101_Mario_YourPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_YourPrice_15_00"); //Co za to chce�?
	AI_Output (self ,other,"DIA_None_101_Mario_YourPrice_07_01"); //Co bych cht�l? Budu r�d, �e odsud vypadnu.
	AI_Output (self ,other,"DIA_None_101_Mario_YourPrice_07_02"); //Pl�cneme si. J� ti pom��u a ty m� odsud dostane�.
};

//*********************************************************************
//	Die Reise kann gef�hrlich werden.
//*********************************************************************
INSTANCE DIA_None_101_Mario_CouldBeDangerous   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 10;
	condition   = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent   = FALSE;
	description	= "Ta cesta m��e b�t nebezpe�n�.";
};

FUNC INT DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YourPrice))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_CouldBeDangerous_15_00"); //Ta cesta m��e b�t nebezpe�n�.
	AI_Output (self ,other,"DIA_None_101_Mario_CouldBeDangerous_07_01"); //Na nebezpe�� jsem zvykl�. Kdy� jsi na mo�i, je ka�d� den nebezpe�n�.
	AI_Output (self ,other,"DIA_None_101_Mario_CouldBeDangerous_07_02"); //P��t� bou�e m��e b�t tvoje smrt a p��ery z hlubin dok�� spolknout celou lo� jako malinu.
	AI_Output (self ,other,"DIA_None_101_Mario_CouldBeDangerous_07_03"); //A o sk�et�ch gal�r�ch snad ani mluvit nemus�m, �e? V�� mi, nenajde se nic, �eho bych se b�l. N�mo�n�k, kter� se boj�, je u� p�edem mrtv�.
};

//*********************************************************************
//	Kein Bedarf!
//*********************************************************************
INSTANCE DIA_None_101_Mario_DontNeedYou   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 13;
	condition   = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent   = FALSE;
	description	= "K ni�emu bys mi nebyl.";
};

FUNC INT DIA_None_101_Mario_DontNeedYou_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_DontNeedYou_15_00"); //K ni�emu bys mi nebyl.
	AI_Output (self ,other,"DIA_None_101_Mario_DontNeedYou_07_01"); //Jsem nejlep�� n�mo�n�k, kter�ho tady m��e� sehnat.
	AI_Output (self ,other,"DIA_None_101_Mario_DontNeedYou_07_02"); //Sta�� se na tebe pod�vat a hned je jasn�, �e o navigaci nev�, co by se za nehet ve�lo.
	AI_Output (self ,other,"DIA_None_101_Mario_DontNeedYou_07_03"); //Tak�e rad�i v�echno dvakr�t zva�, ne� bude� n�komu v��it.
};

//*********************************************************************
//	Gute Leute kann ich immer brauchen.
//*********************************************************************
INSTANCE DIA_None_101_Mario_NeedGoodMen   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 2;
	condition   = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent   = FALSE;
	description	= "Dob�� pomocn�ci se v�dycky hod�.";
};

FUNC INT DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_NeedGoodMen_15_00"); //Dob�� pomocn�ci se v�dycky hod�.
	AI_Output (self ,other,"DIA_None_101_Mario_NeedGoodMen_07_01"); //Jasn� v�c, uvid�me se na lodi.
	
	B_GivePlayerXP (XP_Crewmember_Success);
	
	Mario_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	AI_StopProcessInfos (self);
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Mario_LeaveMyShip		(C_INFO)
{
	npc			 = 	NONE_101_MARIO;
	nr			 = 11;
	condition	 = 	DIA_Mario_LeaveMyShip_Condition;
	information	 = 	DIA_Mario_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"P�ece jenom bys mi k ni�emu nebyl!";
};
func int DIA_Mario_LeaveMyShip_Condition ()
{	
	if (Mario_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Mario_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Mario_LeaveMyShip_15_00"); //P�ece jenom bys mi k ni�emu nebyl!
	AI_Output			(self, other, "DIA_Mario_LeaveMyShip_07_01"); //Jak je libo. V�, kde m� naj�t!
	
	Mario_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Mario_StillNeedYou		(C_INFO)
{
	npc			 = 	NONE_101_MARIO;
	nr			 = 	11;
	condition	 = 	DIA_Mario_StillNeedYou_Condition;
	information	 = 	DIA_Mario_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"P�ece jenom bys mi k n��emu mohl b�t!";
};
func int DIA_Mario_StillNeedYou_Condition ()
{	
	if((Mario_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man nat�rlich nur eine variable abfragen
	|| (Mario_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Mario_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Mario_StillNeedYou_15_00"); //P�ece jenom bys mi k n��emu mohl b�t!
	
	if (Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Mario_StillNeedYou_07_01"); //V�d�l jsem to! Uvid�me se na lodi!
		
		Mario_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
		AI_StopProcessInfos (self);
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Mario_StillNeedYou_07_02"); //Takhle se ke mn� chovat nesm�. Vykuch�m t�!
	
		AI_StopProcessInfos (self);
		
		B_Attack	(self,other,AR_NONE,1); 
	};	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_MARIO_PICKPOCKET (C_INFO)
{
	npc			= NONE_101_MARIO;
	nr			= 900;
	condition	= DIA_MARIO_PICKPOCKET_Condition;
	information	= DIA_MARIO_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_MARIO_PICKPOCKET_Condition()
{
	C_Beklauen (71, 220);
};
 
FUNC VOID DIA_MARIO_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_MARIO_PICKPOCKET);
	Info_AddChoice		(DIA_MARIO_PICKPOCKET, DIALOG_BACK 		,DIA_MARIO_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_MARIO_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_MARIO_PICKPOCKET);
};
	
func void DIA_MARIO_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_MARIO_PICKPOCKET);
};


