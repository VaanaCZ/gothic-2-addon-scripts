
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Jorgen_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP3_EXIT_Condition;
	information	= DIA_Jorgen_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Jorgen_PICKPOCKET (C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 900;
	condition	= DIA_Jorgen_PICKPOCKET_Condition;
	information	= DIA_Jorgen_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jorgen_PICKPOCKET_Condition()
{
	C_Beklauen (59, 70);
};
 
FUNC VOID DIA_Jorgen_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jorgen_PICKPOCKET);
	Info_AddChoice		(DIA_Jorgen_PICKPOCKET, DIALOG_BACK 		,DIA_Jorgen_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jorgen_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jorgen_PICKPOCKET_DoIt);
};

func void DIA_Jorgen_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jorgen_PICKPOCKET);
};
	
func void DIA_Jorgen_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jorgen_PICKPOCKET);
};
//*********************************************************************
//	Info Hallo 
//*********************************************************************
INSTANCE DIA_Jorgen_Hallo   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 4;
	condition   = DIA_Jorgen_Hallo_Condition;
	information = DIA_Jorgen_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_Jorgen_Hallo_Condition()
{
	if (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Jorgen_Hallo_07_00"); //Hej, ty!

	if ((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_01"); //Widz�, �e przybywasz z klasztoru mag�w?
		AI_Output (other,self ,"DIA_Jorgen_Hallo_15_02"); //Tak, czemu pytasz?
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_03"); //Nie przyda�by si� wam tam dodatkowy robotnik?
	}
	else
	{
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_04"); //Ej, ty! By�e� kiedy� w klasztorze?
		AI_Output (other,self ,"DIA_Jorgen_Hallo_15_05"); //Mo�e, a czemu pytasz?
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_06"); //Ci�gle przyjmuj� tam nowych ludzi?
	};

	AI_Output (self ,other,"DIA_Jorgen_Hallo_07_07"); //Nie wiem ju�, do kogo m�g�bym si� zwr�ci�.
}; 

//*********************************************************************
//	Hast du einen Novizen hier vorbeirennen gesehen? 
//*********************************************************************
INSTANCE DIA_Jorgen_Novice   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 6;
	condition   = DIA_Jorgen_Novice_Condition;
	information = DIA_Jorgen_Novice_Info;
	permanent   = FALSE;
	description	= "Nie przechodzi� t�dy jaki� nowicjusz?";
};

FUNC INT DIA_Jorgen_Novice_Condition()
{
	IF (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Novice_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Novice_15_00"); //Nie przechodzi� t�dy jaki� nowicjusz?
	AI_Output (self ,other,"DIA_Jorgen_Novice_07_01"); //Jasne. Tam pobieg�.
	AI_PointAt	(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output (self,other,"DIA_Jorgen_Novice_07_02"); //Skoczy� z mostu do wody i pop�yn��, jakby ucieka� przed stadem rekin�w.
	AI_StopPointAt(self);
}; 

//*********************************************************************
//	Wenn du ins Kloster willst, solltest du mir Milten reden. 
//*********************************************************************
INSTANCE DIA_Jorgen_Milten   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 5;
	condition   = DIA_Jorgen_Milten_Condition;
	information = DIA_Jorgen_Milten_Info;
	permanent   = FALSE;
	description	= "Je�li udajesz si� do klasztoru, porozmawiaj koniecznie z Miltenem.";
};

FUNC INT DIA_Jorgen_Milten_Condition()
{
	if (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
	&& (MIS_OLDWORLD == LOG_SUCCESS)
	&& (MiltenNW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
			return TRUE;
	};
};

FUNC VOID DIA_Jorgen_Milten_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Milten_15_00"); //Je�li udajesz si� do klasztoru, porozmawiaj koniecznie z Miltenem. On ci pomo�e.
	AI_Output (self ,other,"DIA_Jorgen_Milten_07_01"); //Jak my�lisz, wpuszcz� mnie tam?
	AI_Output (other,self ,"DIA_Jorgen_Milten_15_02"); //Mo�e. Chocia� jako� nie wyobra�am sobie ciebie w szatach nowicjusza.
	AI_Output (self ,other,"DIA_Jorgen_Milten_07_03"); //Do�� tych bzdur. Szata nowicjusza, jasne! Jedzenie, przyjacielu, to jest podstawa! Jak tak dalej p�jdzie, b�d� si� �ywi� korzonkami!
}; 

//*********************************************************************
//	DIA_Jorgen_Home
//*********************************************************************

INSTANCE DIA_Jorgen_Home   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 7;
	condition   = DIA_Jorgen_Home_Condition;
	information = DIA_Jorgen_Home_Info;

	description	= "Sk�d pochodzisz?";
};

FUNC INT DIA_Jorgen_Home_Condition()
{
	if (Kapitel >= 3) 
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Home_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Home_15_00"); //Sk�d pochodzisz?
	AI_Output (self ,other,"DIA_Jorgen_Home_07_01"); //Kiedy� by�em kapitanem wielorybniczego statku. M�j dom jest na morzu.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_02"); //Par� miesi�cy temu piraci pos�ali moj� 'Magdalen�' na dno i od tej pory tkwi� na tej wyspie.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_03"); //Pr�bowa�em zaci�gn�� si� na jak�� �ajb�, ale przez ca�y ten czas nie widzia�em tu nawet spr�chnia�ego cz�na!
	AI_Output (self ,other,"DIA_Jorgen_Home_07_04"); //Jedyny statek w Khorinis to ten przekl�ty kr�lewski galeon, ale tam mnie raczej nie przyjm�.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_05"); //Wi�c co mam robi�? W mie�cie nie ma dla mnie pracy. Pr�bowa�em chyba wszystkiego.
	
}; 

//*********************************************************************
//	DIA_Jorgen_BeCarefull
//*********************************************************************
INSTANCE DIA_Jorgen_BeCarefull   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 8;
	condition   = DIA_Jorgen_BeCarefull_Condition;
	information = DIA_Jorgen_BeCarefull_Info;
	permanent   = TRUE;
	description	= "Lepiej zejd� z drogi.";
};

FUNC INT DIA_Jorgen_BeCarefull_Condition()
{
	if (Kapitel == 3) 
		&& (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_BeCarefull_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_BeCarefull_15_00"); //Lepiej zejd� z drogi.
	AI_Output (self ,other,"DIA_Jorgen_BeCarefull_07_01"); //Ech... Bez obaw. Zd��y�em ju� zauwa�y�, �e od paru dni jest tu cholernie niebezpiecznie.
}; 

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Jorgen_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP4_EXIT_Condition;
	information	= DIA_Jorgen_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NeuHier
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_NEUHIER		(C_INFO)
{	
	npc		 	= 	VLK_4250_Jorgen;
	nr		 	= 	41;
	condition	= 	DIA_Jorgen_NEUHIER_Condition;
	information	= 	DIA_Jorgen_NEUHIER_Info;

	description	= 	"Jak ci si� podoba �ycie w klasztorze?";
};

func int DIA_Jorgen_NEUHIER_Condition ()
{
	if (Kapitel >= 4)	
	{
		return TRUE;
	};
};

func void DIA_Jorgen_NEUHIER_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_NEUHIER_15_00"); //Jak ci si� podoba �ycie w klasztorze?
	
	AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_01"); //Ja tu chyba zwariuj�!

	if (Npc_KnowsInfo(other, DIA_Jorgen_Milten))
	{
		AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_02"); //Ale dzi�ki za pomoc. Milten rzeczywi�cie znalaz� tu dla mnie miejsce.
		B_GivePlayerXP (XP_Ambient);
	};

	if (hero.guild != GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_03"); //G�upio si� czuj� pomi�dzy tymi wszystkimi �wi�toszkami.
	};

	AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_04"); //Ale z dwojga z�ego... wol� robi�, co mi ka��, ni� przymiera� g�odem!
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_PERM4		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	400;
	condition	 = 	DIA_Jorgen_PERM4_Condition;
	information	 = 	DIA_Jorgen_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nic ci nie b�dzie.";
};

func int DIA_Jorgen_PERM4_Condition ()
{
	if (Kapitel >= 4)	
		&&	(Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&	(Npc_KnowsInfo(other, DIA_Jorgen_NEUHIER))
		&& 	(JorgenIsCaptain == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Jorgen_PERM4_OneTime;
func void DIA_Jorgen_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_PERM4_15_00"); //Nic ci nie b�dzie.
	if (DIA_Jorgen_PERM4_OneTime == FALSE)
	&& (hero.guild != GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Jorgen_PERM4_07_01"); //Kazali mi pieli� grz�dki! Wyobra�asz sobie? Jak tak dalej p�jdzie, zwariuj� tu z kretesem.
		DIA_Jorgen_PERM4_OneTime = TRUE;
	};
	
	AI_Output			(self, other, "DIA_Jorgen_PERM4_07_02"); //Solidny pok�ad pod nogami - oto czego mi trzeba!
};

//#####################################################################
//##
//##
//##					KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Jorgen_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP5_EXIT_Condition;
	information	= DIA_Jorgen_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	51;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"M�g�bym ci� zatrudni� jako kapitana na moim statku.";
};

func int DIA_Jorgen_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_PyrokarClearDemonTower != LOG_SUCCESS)
		&& (Npc_KnowsInfo(other, DIA_Jorgen_Home))

		{
				return TRUE;
		};
};
var int DIA_Jorgen_BEMYCAPTAIN_OneTime;
func void DIA_Jorgen_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN_15_00"); //M�g�bym ci� zatrudni� jako kapitana na moim statku.
	if (DIA_Jorgen_BEMYCAPTAIN_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_01"); //Ej, chyba mnie nie nabierasz, co? Je�li m�wisz serio, mo�esz na mnie liczy�!
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_02"); //Eeee... Jest tylko jeden ma�y problem. Wy�ar�em nowicjuszom po�ow� spi�arni.
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_03"); //Strasznie si� z tego powodu zez�o�cili. Obawiam si�, �e mog� nie chcie� mnie st�d wypu�ci�.
		DIA_Jorgen_BEMYCAPTAIN_OneTime = TRUE;
	};
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_04"); //Najpierw musz� odpracowa� sw�j d�ug u Pyrokara. Przykro mi.
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                                                                                                                                            
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                                                                                                                                          
    B_LogEntry (TOPIC_Captain,"Jorgen zostanie moim kapitanem, je�li sp�ac� jego d�ugi wzgl�dem klasztoru.");

};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	52;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN2_Info;

	description	 = 	"Zaj��em si� twoim d�ugiem.";
};

func int DIA_Jorgen_BEMYCAPTAIN2_Condition ()
{
	if (MIS_PyrokarClearDemonTower == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_BEMYCAPTAIN2_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN2_15_00"); //Zaj��em si� twoim d�ugiem. Jeste� wolny.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_01"); //Naprawd�? Jak tego dokona�e�?
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN2_15_02"); //Nie chcesz wiedzie�.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_03"); //W sumie to prawda. Wielkie dzi�ki!

	if (SCGotCaptain == FALSE)
	{
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_04"); //A co z twoj� ofert�? Nadal widzisz mnie w swojej za�odze?
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_05"); //To �wietnie. Ruszajmy w drog�.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"RausAusKloster");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	53;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN3_Info;

	description	 = 	"Zosta� kapitanem mojego statku.";
};

func int DIA_Jorgen_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN3_15_00"); //Zosta� kapitanem mojego statku.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_01"); //Czuj� si� zaszczycony, ale czy ty w og�le MASZ ten statek? A za�og�?
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_02"); //My�l�, �e pi�ciu ludzi powinno wystarczy�.
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN3_15_03"); //Dobrze. Zobacz�, co si� da zrobi�. Czekaj na mnie na przystani.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_04"); //Tak jest!
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JorgenIsCaptain = TRUE;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	59;
	condition	 = 	DIA_Jorgen_LOSFAHREN_Condition;
	information	 = 	DIA_Jorgen_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jeste� got�w, by pop�yn�� na wysp�?";
};

func int DIA_Jorgen_LOSFAHREN_Condition ()
{
	if (JorgenIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_LOSFAHREN_15_00"); //Jeste� got�w, by pop�yn�� na wysp�?

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_01"); //Oczywi�cie. Daj mi t� map�.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_02"); //�wietnie. Zatem �agle na maszt i ruszamy w drog�!
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_03"); //Tylko sprawd�, czy masz wszystko, czego potrzebujesz. Jak ju� wyruszymy, nie b�dziemy mogli zawr�ci�.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_04"); //Potem mo�esz si� troch� zdrzemn��. W kajucie kapitana jest wolna koja. Mi�ych sn�w!
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_05"); //Musisz mie� statek, co najmniej pi�ciu cz�onk�w za�ogi i map�, kt�rej b�d� potrzebowa� do nawigacji.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_06"); //Nie wyp�yniemy, p�ki nie b�dziesz mia� wszystkich potrzebnych rzeczy.
	AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	59;
	condition	 = 	DIA_Jorgen_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jorgen_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jak si� masz?";
};

func int DIA_Jorgen_PERM5_NOTCAPTAIN_Condition ()
{
	if	(Npc_KnowsInfo(other, DIA_Jorgen_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JorgenIsCaptain == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven;
func void DIA_Jorgen_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_PERM5_NOTCAPTAIN_15_00"); //Jak si� masz?

	if 	(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06")<1000)  
	{
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_01"); //Nie�le. Da si� tu wytrzyma�.
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_02"); //Dalej przydzielaj� mi jakie� g�upie zadania, jak pilnowanie owiec, ale w por�wnaniu z klasztorem to prawdziwy raj!

		if (DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven == FALSE)
		{
		B_GivePlayerXP (XP_Ambient);
		DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven = TRUE;
		};
	AI_StopProcessInfos (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_03"); //Musz� sobie poszuka� jakiego� innego miejsca. Ciekawe, dok�d zanios� mnie wiatry tym razem?

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"RausAusKloster");
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Jorgen_KAP6_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP6_EXIT_Condition;
	information	= DIA_Jorgen_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};












































