///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rosi_EXIT   (C_INFO)
{
	npc         = BAU_936_Rosi;
	nr          = 999;
	condition   = DIA_Rosi_EXIT_Condition;
	information = DIA_Rosi_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rosi_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Rosi_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_HALLO		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	3;
	condition	 = 	DIA_Rosi_HALLO_Condition;
	information	 = 	DIA_Rosi_HALLO_Info;

	description	 = 	"Wszystko w porz�dku?";
};

func int DIA_Rosi_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rosi_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_HALLO_15_00"); //Wszystko w porz�dku?
	AI_Output			(self, other, "DIA_Rosi_HALLO_17_01"); //C�, w�a�ciwie nie do ko�ca. Kr�gos�up strasznie mnie boli od ci�kiej pracy. Co ci� tu sprowadza? Tak rzadko miewam go�ci.

	if ((hero.guild != GIL_MIL))
	{
		AI_Output			(self, other, "DIA_Rosi_HALLO_17_02"); //Na og� odwiedzaj� mnie albo zbiry z g�r, albo ci okropni stra�nicy miejscy.
		AI_Output			(self, other, "DIA_Rosi_HALLO_17_03"); //Ostatnio do�� cz�sto nachodz� farmy, ale ty nie wygl�dasz jak jeden z nich.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	4;
	condition	 = 	DIA_Rosi_WASMACHSTDU_Condition;
	information	 = 	DIA_Rosi_WASMACHSTDU_Info;

	description	 = 	"Co tu porabiasz?";
};

func int DIA_Rosi_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_HALLO))
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Rosi_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_WASMACHSTDU_15_00"); //Czym si� zajmujesz?

	if (Npc_IsDead(Sekob)== FALSE)
	{
	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_01"); //Od lat sama si� o to pytam. M�j m��, Sekob, ma na pie�ku ju� chyba ze wszystkimi w okolicy.
	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_02"); //Jest zad�u�ony po uszy. Dlatego te� podkrada r�ne towary Onarowi, sprzedaj�c je p�niej w mie�cie.
	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_03"); //Dzi�ki tym machlojkom uda�o mu si� zbi� fortun�.
	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_04"); //Ka�e ludziom pracowa� tak d�ugo, a� biedakom zaczynaj� si� �ama� kr�gos�upy. Dosz�o do tego, �e nazywaj� go nadzorc� niewolnik�w.
	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_05"); //Nie jestem specjalnie dumna z tego, �e Sekob jest moim m�em, uwierz mi. Czasem �a�uj�, �e nie ma ju� Bariery.
	};

	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_06"); //Mo�e chcia�by� kupi� co� do jedzenia albo bro� do polowania w lesie?
	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader,"Rosi sprzedaje na farmie Sekoba przer�ne towary.");
};

///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_WAREZ		(C_INFO)
{
	npc			 = 	BAU_936_Rosi;
	nr			 = 	2;
	condition	 = 	DIA_Rosi_WAREZ_Condition;
	information	 = 	DIA_Rosi_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Co mo�esz mi zaoferowa�?";
};

func int DIA_Rosi_WAREZ_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
		|| ((Kapitel >= 5)	&&	(Npc_KnowsInfo(other, DIA_Rosi_FLEEFROMSEKOB)))
		||  (Npc_IsDead(Sekob))
		)
		&& (MIS_bringRosiBackToSekob != LOG_SUCCESS)
		{
				return TRUE;
		};
};
func void DIA_Rosi_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Rosi_WAREZ_15_00"); //Co mo�esz mi zaoferowa�?
	AI_Output (self, other, "DIA_Rosi_WAREZ_17_01"); //A czego potrzebujesz?
};

///////////////////////////////////////////////////////////////////////
//	Info barriere
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_BARRIERE		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	6;
	condition	 = 	DIA_Rosi_BARRIERE_Condition;
	information	 = 	DIA_Rosi_BARRIERE_Info;

	description	 = 	"Bariery?";
};

func int DIA_Rosi_BARRIERE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
	&& (Npc_IsDead(Sekob)== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Rosi_BARRIERE_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_BARRIERE_15_00"); //Bariery?
	AI_Output			(self, other, "DIA_Rosi_BARRIERE_17_01"); //No wiesz, kopu�y otaczaj�cej do niedawna G�rnicz� Dolin�.
	AI_Output			(self, other, "DIA_Rosi_BARRIERE_17_02"); //Wielu robotnik�w i farmer�w, kt�rzy pope�nili jakie� przest�pstwa, po prostu tam wrzucano, ju� nigdy nie wracali.

};

///////////////////////////////////////////////////////////////////////
//	Info DuInBarriere
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_DuInBarriere		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	10;
	condition	 = 	DIA_Rosi_DuInBarriere_Condition;
	information	 = 	DIA_Rosi_DuInBarriere_Info;

	description	 = 	"Widzia�a� kiedykolwiek Barier�?";
};

func int DIA_Rosi_DuInBarriere_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_BARRIERE))
		{
				return TRUE;
		};
};

func void DIA_Rosi_DuInBarriere_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_DuInBarriere_15_00"); //Widzia�a� kiedykolwiek Barier�?
	AI_Output			(self, other, "DIA_Rosi_DuInBarriere_17_01"); //Nie. Jedynie o niej s�ysza�am. Bengar, farmer z pastwisk po�o�onych nieco wy�ej, na pewno b�dzie m�g� powiedzie� ci wi�cej.
	AI_Output			(self, other, "DIA_Rosi_DuInBarriere_17_02"); //Jego farma znajduje si� niedaleko prze��czy prowadz�cej do G�rniczej Doliny.

};


///////////////////////////////////////////////////////////////////////
//	Info Bengar
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_BENGAR		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	11;
	condition	 = 	DIA_Rosi_BENGAR_Condition;
	information	 = 	DIA_Rosi_BENGAR_Info;

	description	 = 	"Jak doj�� do farmy Bengara?";
};

func int DIA_Rosi_BENGAR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_DuInBarriere))
	&& (Npc_IsDead(Balthasar)==FALSE)
		{
				return TRUE;
		};
};

func void DIA_Rosi_BENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_BENGAR_15_00"); //Jak doj�� do farmy Bengara?
	AI_Output			(self, other, "DIA_Rosi_BENGAR_17_01"); //Zapytaj o to Balthasara. To nasz pasterz. Czasem prowadzi stado na pastwiska Bengara.
	AI_Output			(self, other, "DIA_Rosi_BENGAR_17_02"); //Jestem pewna, �e powie ci, jak tam doj��.
		
};


///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_Miliz		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	7;
	condition	 = 	DIA_Rosi_Miliz_Condition;
	information	 = 	DIA_Rosi_Miliz_Info;

	description	 = 	"Dlaczego stra� atakuje wasze farmy?";
};

func int DIA_Rosi_Miliz_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
	&& ((hero.guild != GIL_MIL))
		{
				return TRUE;
		};
};

func void DIA_Rosi_Miliz_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_Miliz_15_00"); //Dlaczego stra� miejska atakuje wasze farmy?
	AI_Output			(self, other, "DIA_Rosi_Miliz_17_01"); //Poniewa� nie ma ich kto chroni�, �atwiej jest je spl�drowa� i okra��, ni� kupowa� towary.
	AI_Output			(self, other, "DIA_Rosi_Miliz_17_02"); //Kr�l jest daleko st�d, musimy wi�c pracowa� dla Onara i mie� nadziej�, �e przy�le na czas swoich ludzi, �eby uchronili nas przed atakami.
};


///////////////////////////////////////////////////////////////////////
//	Info Onar
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_ONAR		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	8;
	condition	 = 	DIA_Rosi_ONAR_Condition;
	information	 = 	DIA_Rosi_ONAR_Info;

	description	 = 	"Jak wygl�da pomoc ze strony Onara?";
};

func int DIA_Rosi_ONAR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_Miliz))
		{
				return TRUE;
		};
};

func void DIA_Rosi_ONAR_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_ONAR_15_00"); //Jak wygl�da pomoc ze strony Onara?
	AI_Output			(self, other, "DIA_Rosi_ONAR_17_01"); //Czasami wiemy wcze�niej o planowanym przez stra� ataku.
	AI_Output			(self, other, "DIA_Rosi_ONAR_17_02"); //Wtedy wysy�amy kogo� na farm� w�a�ciciela ziemskiego i prosimy o pomoc.
	AI_Output			(self, other, "DIA_Rosi_ONAR_17_03"); //Z regu�y najemnicy, kt�rych op�aca, przybywaj� tu na czas, by rozprawi� si� ze stra�nikami.
	AI_Output			(self, other, "DIA_Rosi_ONAR_17_04"); //Ale tak po prawdzie, najemnicy wcale nie s� du�o lepsi od naje�d�c�w.
};

///////////////////////////////////////////////////////////////////////
//	Info Permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	80;
	condition	 = 	DIA_Rosi_PERMKAP1_Condition;
	information	 = 	DIA_Rosi_PERMKAP1_Info;
	permanent	 =	TRUE;
	description	 = 	"G�owa do g�ry.";
};

func int DIA_Rosi_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
	|| ((Kapitel >= 5)	&&	(Npc_KnowsInfo(other, DIA_Rosi_FLEEFROMSEKOB)))
		{
					return TRUE;
			};
};

func void DIA_Rosi_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_PERMKAP1_15_00"); //G�owa do g�ry.


	if ((MIS_bringRosiBackToSekob == LOG_SUCCESS))
		{
			AI_Output			(self, other, "DIA_Rosi_PERMKAP1_17_01"); //Id� si� utop w jeziorze!
		}
	else
		{
			AI_Output			(self, other, "DIA_Rosi_PERMKAP1_17_02"); //Uwa�aj na siebie i nie pozw�l, by ci� dopadli.
		};
	AI_StopProcessInfos (self);
};


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

INSTANCE DIA_Rosi_KAP3_EXIT(C_INFO)
{
	npc			= BAU_936_Rosi;
	nr			= 999;
	condition	= DIA_Rosi_KAP3_EXIT_Condition;
	information	= DIA_Rosi_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rosi_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rosi_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Rosi_KAP4_EXIT(C_INFO)
{
	npc			= BAU_936_Rosi;
	nr			= 999;
	condition	= DIA_Rosi_KAP4_EXIT_Condition;
	information	= DIA_Rosi_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rosi_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rosi_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Rosi_KAP5_EXIT(C_INFO)
{
	npc			= BAU_936_Rosi;
	nr			= 999;
	condition	= DIA_Rosi_KAP5_EXIT_Condition;
	information	= DIA_Rosi_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rosi_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rosi_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FleefromSekob
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_FLEEFROMSEKOB		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	50;
	condition	 = 	DIA_Rosi_FLEEFROMSEKOB_Condition;
	information	 = 	DIA_Rosi_FLEEFROMSEKOB_Info;

	description	 = 	"Co robisz w tej dziczy?";
};

func int DIA_Rosi_FLEEFROMSEKOB_Condition ()
{
	if (Kapitel == 5)	
	&& (Rosi_FleeFromSekob_Kap5 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Rosi_FLEEFROMSEKOB_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_FLEEFROMSEKOB_15_00"); //Co robisz w tej dziczy?
	AI_Output			(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_01"); //Nie mog�am ju� d�u�ej wytrzyma� na farmie Sekoba. Kl�� jak szewc.
	AI_Output			(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_02"); //Krzycza� i krzycza�, w ko�cu w og�le nie da�o si� z nim rozmawia�.
	AI_Output			(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_03"); //Musz� si� st�d wynosi�, ale nie wiem, dok�d i��.
	AI_Output			(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_04"); //Mo�e zechcia�by� mi pom�c?
	B_GivePlayerXP (XP_Ambient);
	RosiFoundKap5 = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_HILFE		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	51;
	condition	 = 	DIA_Rosi_HILFE_Condition;
	information	 = 	DIA_Rosi_HILFE_Info;

	description	 = 	"Chc� ci� st�d zabra�.";
};

func int DIA_Rosi_HILFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_FLEEFROMSEKOB))
	&& (Rosi_FleeFromSekob_Kap5 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Rosi_HILFE_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_HILFE_15_00"); //Chc� ci� st�d zabra�.

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Till.aivar[AIV_PARTYMEMBER] = TRUE;
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Rosi_HILFE_15_01"); //M�g�bym odprowadzi� ci� do miasta.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Rosi_HILFE_15_02"); //Zaprowadz� ci� na farm� w�a�ciciela.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Rosi_HILFE_15_03"); //Chod� ze mn� do klasztoru, znajdziesz tam gor�ce przyj�cie.
		};	
		
		AI_Output			(self, other, "DIA_Rosi_HILFE_17_04"); //Nigdy nie zapomn� co dla mnie zrobi�e� i oczywi�cie zap�ac�.

			if (Npc_IsDead(Till))
			{
				AI_Output			(self, other, "DIA_Rosi_HILFE_17_05"); //Id� przodem, b�d� sz�a za tob�.
			}
			else
			{
				AI_Output			(self, other, "DIA_Rosi_HILFE_17_06"); //Id� przodem, b�dziemy szli za tob�.
			};
		
		AI_StopProcessInfos (self);	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			Npc_ExchangeRoutine	(self,"FollowCity"); 
			B_StartOtherRoutine (Till,"FollowCity"); 
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Npc_ExchangeRoutine	(self,"FollowBigfarm"); 
			B_StartOtherRoutine (Till,"FollowBigfarm"); 
		};

		if (hero.guild == GIL_KDF)
		{
			Npc_ExchangeRoutine	(self,"FollowKloster"); 
			B_StartOtherRoutine (Till,"FollowKloster"); 
		};	
		Log_CreateTopic (TOPIC_RosisFlucht, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RosisFlucht, LOG_RUNNING);
		B_LogEntry (TOPIC_RosisFlucht,"Rosi nie mog�a wytrzyma� na farmie Sekoba, ale teraz nie wie, gdzie si� uda�. Wyprowadz� j� z tej g�uszy."); 
		MIS_RosisFlucht = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info angekommen
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_ANGEKOMMEN		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	55;
	condition	 = 	DIA_Rosi_ANGEKOMMEN_Condition;
	information	 = 	DIA_Rosi_ANGEKOMMEN_Info;
	important	 = 	TRUE;

};

func int DIA_Rosi_ANGEKOMMEN_Condition ()
{
	if 	(Kapitel == 5)
	&&	(MIS_bringRosiBackToSekob != LOG_SUCCESS)
	&& (Rosi_FleeFromSekob_Kap5 == TRUE)
	&&	(
			(	(Npc_GetDistToWP(self,"CITY2")<6000) 	&& (hero.guild == GIL_PAL)	)
		||	(	(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02")<6000) 	&& (hero.guild == GIL_DJG)	)
		||	(	(Npc_GetDistToWP(self,"KLOSTER")<6000)  && (hero.guild == GIL_KDF)	)
		)
			{
				return TRUE;
			};
};

func void DIA_Rosi_ANGEKOMMEN_Info ()
{
	AI_Output			(self, other, "DIA_Rosi_ANGEKOMMEN_17_00"); //Dalej ju� sobie poradz�.
	AI_Output			(self, other, "DIA_Rosi_ANGEKOMMEN_17_01"); //Bardzo ci dzi�kuj�. C� ja bym bez ciebie zrobi�a.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Till.aivar[AIV_PARTYMEMBER] = FALSE;

	MIS_bringRosiBackToSekob = LOG_OBSOLETE;
	MIS_RosisFlucht = LOG_SUCCESS;
		AI_Output			(self, other, "DIA_Rosi_ANGEKOMMEN_17_02"); //Prosz�, przyjmij w podzi�ce ten skromny podarek.

		CreateInvItems (Rosi, ItMi_Gold, 650);									
		B_GiveInvItems (self, other, ItMi_Gold, 450);					

		if (Npc_IsDead(Till))
		{
			B_GivePlayerXP (XP_SavedRosi);
		}
		else
		{
			var int XPForBoth;
			XPForBoth = (XP_SavedRosi + XP_Ambient);
			B_GivePlayerXP (XPForBoth);
		};

		AI_StopProcessInfos (self);
	
			if	(Npc_GetDistToWP(self,"CITY2")<8000)
			{
				Npc_ExchangeRoutine	(self,"CITY");
				B_StartOtherRoutine (Till,"CITY");
			}
			else if	(Npc_GetDistToWP(self,"BIGFARM")<8000) 
			{
				Npc_ExchangeRoutine	(self,"BIGFARM");
				B_StartOtherRoutine (Till,"BIGFARM");
			}
			else if	(Npc_GetDistToWP(self,"KLOSTER")<8000)
			{
				Npc_ExchangeRoutine	(self,"KLOSTER");
				B_StartOtherRoutine (Till,"KLOSTER");
			}; 
};

///////////////////////////////////////////////////////////////////////
//	Info trait
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_TRAIT		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	55;
	condition	 = 	DIA_Rosi_TRAIT_Condition;
	information	 = 	DIA_Rosi_TRAIT_Info;

	description	 = 	"Widzisz, jeste�my w domu.";
};

func int DIA_Rosi_TRAIT_Condition ()
{
	if (MIS_bringRosiBackToSekob == LOG_SUCCESS)
	&& (Rosi_FleeFromSekob_Kap5 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Rosi_TRAIT_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_TRAIT_15_00"); //Widzisz, jeste�my w domu.
	AI_Output			(self, other, "DIA_Rosi_TRAIT_17_01"); //Ty brudna �winio, jeste� najgorszym chamem, jakiego spotka�am w �yciu.
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_RosisFlucht = LOG_FAILED;
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info MinenAnteil
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_MinenAnteil		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	3;
	condition	 = 	DIA_Rosi_MinenAnteil_Condition;
	information	 = 	DIA_Rosi_MinenAnteil_Info;

	description	 = 	"Sprzedajesz nielegalne udzia�y w kopalni, nie wstyd ci?";
};

func int DIA_Rosi_MinenAnteil_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
		{
				return TRUE;
		};
};

func void DIA_Rosi_MinenAnteil_Info ()
{
	AI_Output (other, self, "DIA_Rosi_Minenanteil_15_00"); //Sprzedajesz nielegalne udzia�y w kopalni, nie wstyd ci?
	AI_Output (self, other, "DIA_Rosi_Minenanteil_17_01"); //Nie. Ja te� musz� z czego� �y�. Nie ja, zreszt�, wprowadzi�am je do obiegu.
	B_GivePlayerXP (XP_Ambient);
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


INSTANCE DIA_Rosi_KAP6_EXIT(C_INFO)
{
	npc			= BAU_936_Rosi;
	nr			= 999;
	condition	= DIA_Rosi_KAP6_EXIT_Condition;
	information	= DIA_Rosi_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rosi_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rosi_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rosi_PICKPOCKET (C_INFO)
{
	npc			= BAU_936_Rosi;
	nr			= 900;
	condition	= DIA_Rosi_PICKPOCKET_Condition;
	information	= DIA_Rosi_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Rosi_PICKPOCKET_Condition()
{
	C_Beklauen (30, 75);
};
 
FUNC VOID DIA_Rosi_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rosi_PICKPOCKET);
	Info_AddChoice		(DIA_Rosi_PICKPOCKET, DIALOG_BACK 		,DIA_Rosi_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rosi_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rosi_PICKPOCKET_DoIt);
};

func void DIA_Rosi_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rosi_PICKPOCKET);
};
	
func void DIA_Rosi_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rosi_PICKPOCKET);
};


















































