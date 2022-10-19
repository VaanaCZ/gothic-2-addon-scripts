///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ehnim_EXIT   (C_INFO)
{
	npc         = BAU_944_Ehnim;
	nr          = 999;
	condition   = DIA_Ehnim_EXIT_Condition;
	information = DIA_Ehnim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ehnim_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ehnim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_HALLO		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	3;
	condition	 = 	DIA_Ehnim_HALLO_Condition;
	information	 = 	DIA_Ehnim_HALLO_Info;

	description	 = 	"Kim jeste�?";
};

func int DIA_Ehnim_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Ehnim_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_HALLO_15_00"); //Kim jeste�?
	AI_Output			(self, other, "DIA_Ehnim_HALLO_12_01"); //Nazywam si� Ehnim. Pracuj� na farmie.

	if	(
		(Hlp_IsValidNpc (Egill))
		&& (!C_NpcIsDown (Egill))
		)
			{
				AI_Output			(self, other, "DIA_Ehnim_HALLO_12_02"); //A ten p�g��wek, kt�rego tam widzisz, to m�j brat Egill.
			};
	AI_Output			(self, other, "DIA_Ehnim_HALLO_12_03"); //Akil od lat zatrudnia nas na tej farmie.

};


///////////////////////////////////////////////////////////////////////
//	Info Feldarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_FELDARBEIT		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	4;
	condition	 = 	DIA_Ehnim_FELDARBEIT_Condition;
	information	 = 	DIA_Ehnim_FELDARBEIT_Info;

	description	 = 	"Jak id� prace w polu?";
};

func int DIA_Ehnim_FELDARBEIT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Ehnim_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Ehnim_FELDARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_FELDARBEIT_15_00"); //Jak id� prace w polu?
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_01"); //Chcesz pom�c? Chwytaj motyk�, jest tam z ty�u, i ruszaj na pole.
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_02"); //Bacz tylko, �eby si� nie da� zaskoczy� polnym bestiom. Te potwory potrafi� odgry�� ca�e rami� jednym k�apni�ciem z�b�w.

};

///////////////////////////////////////////////////////////////////////
//	Info feldraeuber
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_FELDRAEUBER		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	5;
	condition	 = 	DIA_Ehnim_FELDRAEUBER_Condition;
	information	 = 	DIA_Ehnim_FELDRAEUBER_Info;

	description	 = 	"Czemu nic z nimi nie zrobicie?";
};

func int DIA_Ehnim_FELDRAEUBER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Ehnim_FELDARBEIT))
		{
				return TRUE;
		};
};

func void DIA_Ehnim_FELDRAEUBER_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_FELDRAEUBER_15_00"); //Czemu nie zrobicie porz�dku z tymi polnymi bestiami?
	AI_Output			(self, other, "DIA_Ehnim_FELDRAEUBER_12_01"); //Zabi�em ich wi�cej, ni� potrafi� zliczy�. Ale ci�gle przy�a�� nowe.

};

///////////////////////////////////////////////////////////////////////
//	Info Streit1
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT1		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	6;
	condition	 = 	DIA_Ehnim_STREIT1_Condition;
	information	 = 	DIA_Ehnim_STREIT1_Info;

	description	 = 	"Tw�j brat powiedzia� mi dok�adnie to samo.";
};

func int DIA_Ehnim_STREIT1_Condition ()
{
	if 	(
			(
			(Npc_KnowsInfo(other, DIA_Egill_FELDRAEUBER))
			&& (Npc_KnowsInfo(other, DIA_Ehnim_FELDRAEUBER))
			&& ((Npc_KnowsInfo(other, DIA_Egill_STREIT2))== FALSE)
			)
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		)
				{
					return TRUE;
				};
			
};

func void DIA_Ehnim_STREIT1_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT1_15_00"); //Tw�j brat powiedzia� mi dok�adnie to samo.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_01"); //Co? Ten tch�rz? Zawsze znika, jak tylko bestie pojawi� si� w okolicy.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_02"); //Nie powinien gada� takich bzdur.
};

///////////////////////////////////////////////////////////////////////
//	Info Streit3
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT3		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	7;
	condition	 = 	DIA_Ehnim_STREIT3_Condition;
	information	 = 	DIA_Ehnim_STREIT3_Info;

	description	 = 	"Tw�j brat uwa�a, �e jeste� nad�tym bufonem.";
};

func int DIA_Ehnim_STREIT3_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Egill_STREIT2))
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		)	
			{
					return TRUE;
			};
};

func void DIA_Ehnim_STREIT3_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT3_15_00"); //Tw�j brat uwa�a, �e jeste� nad�tym bufonem.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_01"); //Co? �e te� ma czelno�� tak bezwstydnie k�ama�!
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_02"); //Niech lepiej baczy, �ebym mu nie da� nauczki.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_03"); //Id�, powiedz mu to.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Streit5
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT5		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	8;
	condition	 = 	DIA_Ehnim_STREIT5_Condition;
	information	 = 	DIA_Ehnim_STREIT5_Info;
	permanent	 =  TRUE;

	description	 = 	"Wydaje mi si�, �e obaj powinni�cie si� nieco uspokoi�.";
};

var int DIA_Ehnim_STREIT5_noPerm;

func int DIA_Ehnim_STREIT5_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Egill_STREIT4))
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		&& (DIA_Ehnim_STREIT5_noPerm == FALSE)
		)	
				{
						return TRUE;
				};
};

func void DIA_Ehnim_STREIT5_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_15_00"); //Wydaje mi si�, �e obaj powinni�cie si� nieco uspokoi�.
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_01"); //Nie chce ust�pi�, co?
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_02"); //Wyrw� mu wszystkie bebechy. Id� mu to powiedzie�.

	Info_ClearChoices	(DIA_Ehnim_STREIT5);

	Info_AddChoice	(DIA_Ehnim_STREIT5, "R�b, co chcesz. Ja odchodz�.", DIA_Ehnim_STREIT5_gehen );
	Info_AddChoice	(DIA_Ehnim_STREIT5, "Czemu sam mu tego nie powiesz?", DIA_Ehnim_STREIT5_Attack );


};
func void DIA_Ehnim_STREIT5_Attack ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_Attack_15_00"); //Czemu sam mu tego nie powiesz?
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_Attack_12_01"); //Zrobi� to.

	AI_StopProcessInfos (self);

	DIA_Ehnim_STREIT5_noPerm = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Egill, AR_NONE, 0);
	
	B_GivePlayerXP (XP_EgillEhnimStreit);
	
};

func void DIA_Ehnim_STREIT5_gehen ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_gehen_15_00"); //R�b, co chcesz. Ja odchodz�.
	AI_Output			(self ,other, "DIA_Ehnim_STREIT5_gehen_12_01"); //Tak, naj�atwiej jest sobie p�j��.
	
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_PERMKAP1_Condition;
	information	 = 	DIA_Ehnim_PERMKAP1_Info;
	important	 = 	TRUE;
	permanent	 =	TRUE;
};

func int DIA_Ehnim_PERMKAP1_Condition ()
{
	if 	(
		(DIA_Ehnim_STREIT5_noPerm == TRUE)
		&& (Npc_IsInState (self,ZS_Talk))
		&& ((Kapitel < 3) || (hero.guild == GIL_KDF))
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_PERMKAP1_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_PERMKAP1_12_00"); //Ma�o jeszcze narobi�e�? Lepiej, jak sobie p�jdziesz.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MoleRatFett
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_MoleRatFett		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_MoleRatFett_Condition;
	information	 = 	DIA_Ehnim_MoleRatFett_Info;
	important	 = 	TRUE;
};

func int DIA_Ehnim_MoleRatFett_Condition ()
{
	if 	(
		(DIA_Ehnim_STREIT5_noPerm == TRUE)
		&& (Kapitel >= 3)
		&& (hero.guild != GIL_KDF)
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_MoleRatFett_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_00"); //DALEJ tu jeste�.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_01"); //Jak widzisz. Wci�� jeste� w�ciek�y?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_02"); //Niewa�ne, zapomnij. Powiedz, by�e� ostatnio na farmie Lobarta?
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_03"); //Mo�e. A czemu pytasz?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_04"); //No... tak tylko. Chcia�em po prostu porozmawia� z Vino o tej jego gorzelni.
	
	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Nie mam teraz czasu.", DIA_Ehnim_MoleRatFett_nein );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Gorzelni? Jakiej gorzelni?", DIA_Ehnim_MoleRatFett_was );

	if (Npc_IsDead(Vino))
	{
		Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Vino nie �yje.", DIA_Ehnim_MoleRatFett_tot );
	};

};
func void DIA_Ehnim_MoleRatFett_tot ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_tot_15_00"); //Vino nie �yje.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_tot_12_01"); //O rety. Hm... No tak.

};

func void DIA_Ehnim_MoleRatFett_was ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_15_00"); //Gorzelni? Jakiej gorzelni?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_01"); //No... pewnie nie powinienem ci tego gada�. Vino zawsze bardzo zwa�a� na ten sw�j ma�y sekret.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_02"); //Niewa�ne, ju� i tak si� wygada�em. Vino ma w lesie ukryt� gorzelni�.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_03"); //Jaki� czas temu prosi� mnie o co�, czym m�g�by nasmarowa� wrota.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_04"); //A ostatnio sporo pada�o i brama zd��y�a doszcz�tnie zardzewie�. Mechanizm si� zaci�� i teraz nie spos�b dosta� si� do �rodka. Niez�y numer.

	Log_CreateTopic (TOPIC_FoundVinosKellerei, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FoundVinosKellerei, LOG_RUNNING);
	B_LogEntry (TOPIC_FoundVinosKellerei,"Ehnim powiedzia� mi, �e Vino ma sekretn� gorzelni� w lesie w pobli�u farmy Akila. Jednak mechanizm otwieraj�cy drzwi zaci�� si�, a do jego uruchomienia potrzebny jest ��j kretoszczura."); 
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "I co? Masz jaki� smar?", DIA_Ehnim_MoleRatFett_was_Fett );
};
func void DIA_Ehnim_MoleRatFett_was_Fett ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_15_00"); //I co? Masz jaki� smar?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_12_01"); //Tak, pewnie. ��j kretoszczura. Obrzydlistwo, ale bardzo skuteczne. U�ywa si� go do konserwacji dzia� okr�towych.
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Sprzedaj mi ten smar.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill );

};
var int Ehnim_MoleRatFettOffer;
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00"); //Sprzedaj mi ten smar.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01"); //To b�dzie troch� kosztowa�o, kolego. W tych stronach to rzadko��.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02"); //Ile za niego chcesz?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03"); //Hm. 100 sztuk z�ota?
	Ehnim_MoleRatFettOffer = 100;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "To stanowczo za du�o!", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Umowa stoi.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00"); //Zgoda.

	if (B_GiveInvItems (other, self, ItMi_Gold,Ehnim_MoleRatFettOffer))
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01"); //Prosz�.
			
			if (Npc_HasItems (self,ItMi_Moleratlubric_MIS))
			{
				B_GiveInvItems (self, other, ItMi_Moleratlubric_MIS, 1);
				
				if (Npc_IsDead(Vino) == FALSE)
					{
						AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02"); //O rety. Vino mnie zabije.
					};					
			}
			else
			{
				AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03"); //Niech to szlag, gdzie on si� podzia�? Co za cholerstwo. No tak, chyba mi si� sko�czy�. No to nie pozostaje mi nic innego, jak zwr�ci� ci twoj� fors�.
				B_GiveInvItems (self, other, ItMi_Gold,Ehnim_MoleRatFettOffer);
				
				if (Npc_IsDead(Egill) == FALSE)
					{
						AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04"); //Pewnikiem to sprawka mojego brata. Prawdziwy z niego dra�.
						AI_StopProcessInfos (self);
						other.aivar[AIV_INVINCIBLE] = FALSE;
						B_Attack (self, Egill, AR_NONE, 0);
					};
			};
		}
	else
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05"); //Wspaniale. Po co to ca�e gadanie, skoro nie masz czym zap�aci�? Szkoda mojego czasu.
		};
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00"); //To za du�o.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01"); //Dobra, dobra. 70 monet, ale to ostatnie s�owo.
	Ehnim_MoleRatFettOffer = 70;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "To wci�� za du�o.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Umowa stoi.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_immernoch_15_00"); //To wci�� za du�o.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_immernoch_12_01"); //No to zapomnij o ca�ej sprawie. Mi�ego dnia.
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_nein ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_nein_15_00"); //Nie mam teraz czasu.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_nein_12_01"); //Nie daj si� zatrzymywa�.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_PERMKAP3		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_PERMKAP3_Condition;
	information	 = 	DIA_Ehnim_PERMKAP3_Info;
	important	 = 	TRUE;
	permanent	 =	TRUE;
};

func int DIA_Ehnim_PERMKAP3_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Ehnim_MoleRatFett))
		&& (Npc_IsInState (self,ZS_Talk))
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_PERMKAP3_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_PERMKAP3_12_00"); //Nie mam teraz czasu.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ehnim_PICKPOCKET (C_INFO)
{
	npc			= BAU_944_Ehnim;
	nr			= 900;
	condition	= DIA_Ehnim_PICKPOCKET_Condition;
	information	= DIA_Ehnim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Ehnim_PICKPOCKET_Condition()
{
	C_Beklauen (76, 35);
};
 
FUNC VOID DIA_Ehnim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ehnim_PICKPOCKET);
	Info_AddChoice		(DIA_Ehnim_PICKPOCKET, DIALOG_BACK 		,DIA_Ehnim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ehnim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ehnim_PICKPOCKET_DoIt);
};

func void DIA_Ehnim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ehnim_PICKPOCKET);
};
	
func void DIA_Ehnim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ehnim_PICKPOCKET);
};
























