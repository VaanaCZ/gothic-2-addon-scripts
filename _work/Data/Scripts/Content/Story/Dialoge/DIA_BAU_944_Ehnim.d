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

	description	 = 	"Kim jesteœ?";
};

func int DIA_Ehnim_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Ehnim_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_HALLO_15_00"); //Kim jesteœ?
	AI_Output			(self, other, "DIA_Ehnim_HALLO_12_01"); //Nazywam siê Ehnim. Pracujê na farmie.

	if	(
		(Hlp_IsValidNpc (Egill))
		&& (!C_NpcIsDown (Egill))
		)
			{
				AI_Output			(self, other, "DIA_Ehnim_HALLO_12_02"); //A ten pó³g³ówek, którego tam widzisz, to mój brat Egill.
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

	description	 = 	"Jak id¹ prace w polu?";
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
	AI_Output			(other, self, "DIA_Ehnim_FELDARBEIT_15_00"); //Jak id¹ prace w polu?
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_01"); //Chcesz pomóc? Chwytaj motykê, jest tam z ty³u, i ruszaj na pole.
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_02"); //Bacz tylko, ¿eby siê nie daæ zaskoczyæ polnym bestiom. Te potwory potrafi¹ odgryŸæ ca³e ramiê jednym k³apniêciem zêbów.

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
	AI_Output			(other, self, "DIA_Ehnim_FELDRAEUBER_15_00"); //Czemu nie zrobicie porz¹dku z tymi polnymi bestiami?
	AI_Output			(self, other, "DIA_Ehnim_FELDRAEUBER_12_01"); //Zabi³em ich wiêcej, ni¿ potrafiê zliczyæ. Ale ci¹gle przy³a¿¹ nowe.

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

	description	 = 	"Twój brat powiedzia³ mi dok³adnie to samo.";
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
	AI_Output			(other, self, "DIA_Ehnim_STREIT1_15_00"); //Twój brat powiedzia³ mi dok³adnie to samo.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_01"); //Co? Ten tchórz? Zawsze znika, jak tylko bestie pojawi¹ siê w okolicy.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_02"); //Nie powinien gadaæ takich bzdur.
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

	description	 = 	"Twój brat uwa¿a, ¿e jesteœ nadêtym bufonem.";
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
	AI_Output			(other, self, "DIA_Ehnim_STREIT3_15_00"); //Twój brat uwa¿a, ¿e jesteœ nadêtym bufonem.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_01"); //Co? ¯e te¿ ma czelnoœæ tak bezwstydnie k³amaæ!
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_02"); //Niech lepiej baczy, ¿ebym mu nie da³ nauczki.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_03"); //IdŸ, powiedz mu to.
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

	description	 = 	"Wydaje mi siê, ¿e obaj powinniœcie siê nieco uspokoiæ.";
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
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_15_00"); //Wydaje mi siê, ¿e obaj powinniœcie siê nieco uspokoiæ.
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_01"); //Nie chce ust¹piæ, co?
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_02"); //Wyrwê mu wszystkie bebechy. IdŸ mu to powiedzieæ.

	Info_ClearChoices	(DIA_Ehnim_STREIT5);

	Info_AddChoice	(DIA_Ehnim_STREIT5, "Rób, co chcesz. Ja odchodzê.", DIA_Ehnim_STREIT5_gehen );
	Info_AddChoice	(DIA_Ehnim_STREIT5, "Czemu sam mu tego nie powiesz?", DIA_Ehnim_STREIT5_Attack );


};
func void DIA_Ehnim_STREIT5_Attack ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_Attack_15_00"); //Czemu sam mu tego nie powiesz?
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_Attack_12_01"); //Zrobiê to.

	AI_StopProcessInfos (self);

	DIA_Ehnim_STREIT5_noPerm = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Egill, AR_NONE, 0);
	
	B_GivePlayerXP (XP_EgillEhnimStreit);
	
};

func void DIA_Ehnim_STREIT5_gehen ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_gehen_15_00"); //Rób, co chcesz. Ja odchodzê.
	AI_Output			(self ,other, "DIA_Ehnim_STREIT5_gehen_12_01"); //Tak, naj³atwiej jest sobie pójœæ.
	
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
	AI_Output			(self, other, "DIA_Ehnim_PERMKAP1_12_00"); //Ma³o jeszcze narobi³eœ? Lepiej, jak sobie pójdziesz.

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
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_00"); //DALEJ tu jesteœ.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_01"); //Jak widzisz. Wci¹¿ jesteœ wœciek³y?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_02"); //Niewa¿ne, zapomnij. Powiedz, by³eœ ostatnio na farmie Lobarta?
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_03"); //Mo¿e. A czemu pytasz?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_04"); //No... tak tylko. Chcia³em po prostu porozmawiaæ z Vino o tej jego gorzelni.
	
	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Nie mam teraz czasu.", DIA_Ehnim_MoleRatFett_nein );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Gorzelni? Jakiej gorzelni?", DIA_Ehnim_MoleRatFett_was );

	if (Npc_IsDead(Vino))
	{
		Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Vino nie ¿yje.", DIA_Ehnim_MoleRatFett_tot );
	};

};
func void DIA_Ehnim_MoleRatFett_tot ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_tot_15_00"); //Vino nie ¿yje.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_tot_12_01"); //O rety. Hm... No tak.

};

func void DIA_Ehnim_MoleRatFett_was ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_15_00"); //Gorzelni? Jakiej gorzelni?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_01"); //No... pewnie nie powinienem ci tego gadaæ. Vino zawsze bardzo zwa¿a³ na ten swój ma³y sekret.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_02"); //Niewa¿ne, ju¿ i tak siê wygada³em. Vino ma w lesie ukryt¹ gorzelniê.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_03"); //Jakiœ czas temu prosi³ mnie o coœ, czym móg³by nasmarowaæ wrota.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_04"); //A ostatnio sporo pada³o i brama zd¹¿y³a doszczêtnie zardzewieæ. Mechanizm siê zaci¹³ i teraz nie sposób dostaæ siê do œrodka. Niez³y numer.

	Log_CreateTopic (TOPIC_FoundVinosKellerei, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FoundVinosKellerei, LOG_RUNNING);
	B_LogEntry (TOPIC_FoundVinosKellerei,"Ehnim powiedzia³ mi, ¿e Vino ma sekretn¹ gorzelniê w lesie w pobli¿u farmy Akila. Jednak mechanizm otwieraj¹cy drzwi zaci¹³ siê, a do jego uruchomienia potrzebny jest ³ój kretoszczura."); 
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "I co? Masz jakiœ smar?", DIA_Ehnim_MoleRatFett_was_Fett );
};
func void DIA_Ehnim_MoleRatFett_was_Fett ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_15_00"); //I co? Masz jakiœ smar?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_12_01"); //Tak, pewnie. £ój kretoszczura. Obrzydlistwo, ale bardzo skuteczne. U¿ywa siê go do konserwacji dzia³ okrêtowych.
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Sprzedaj mi ten smar.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill );

};
var int Ehnim_MoleRatFettOffer;
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00"); //Sprzedaj mi ten smar.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01"); //To bêdzie trochê kosztowa³o, kolego. W tych stronach to rzadkoœæ.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02"); //Ile za niego chcesz?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03"); //Hm. 100 sztuk z³ota?
	Ehnim_MoleRatFettOffer = 100;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "To stanowczo za du¿o!", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Umowa stoi.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00"); //Zgoda.

	if (B_GiveInvItems (other, self, ItMi_Gold,Ehnim_MoleRatFettOffer))
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01"); //Proszê.
			
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
				AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03"); //Niech to szlag, gdzie on siê podzia³? Co za cholerstwo. No tak, chyba mi siê skoñczy³. No to nie pozostaje mi nic innego, jak zwróciæ ci twoj¹ forsê.
				B_GiveInvItems (self, other, ItMi_Gold,Ehnim_MoleRatFettOffer);
				
				if (Npc_IsDead(Egill) == FALSE)
					{
						AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04"); //Pewnikiem to sprawka mojego brata. Prawdziwy z niego drañ.
						AI_StopProcessInfos (self);
						other.aivar[AIV_INVINCIBLE] = FALSE;
						B_Attack (self, Egill, AR_NONE, 0);
					};
			};
		}
	else
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05"); //Wspaniale. Po co to ca³e gadanie, skoro nie masz czym zap³aciæ? Szkoda mojego czasu.
		};
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00"); //To za du¿o.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01"); //Dobra, dobra. 70 monet, ale to ostatnie s³owo.
	Ehnim_MoleRatFettOffer = 70;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "To wci¹¿ za du¿o.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Umowa stoi.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_immernoch_15_00"); //To wci¹¿ za du¿o.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_immernoch_12_01"); //No to zapomnij o ca³ej sprawie. Mi³ego dnia.
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_nein ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_nein_15_00"); //Nie mam teraz czasu.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_nein_12_01"); //Nie daj siê zatrzymywaæ.
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
























