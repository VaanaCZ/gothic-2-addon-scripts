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

	description	 = 	"Kdo jsi?";
};

func int DIA_Ehnim_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Ehnim_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_HALLO_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Ehnim_HALLO_12_01"); //Jmenuju se Ehnim. Jsem jednÌm z n·mezdnÌch rolnÌk˘.

	if	(
		(Hlp_IsValidNpc (Egill))
		&& (!C_NpcIsDown (Egill))
		)
			{
				AI_Output			(self, other, "DIA_Ehnim_HALLO_12_02"); //A t·mhleten prcek je m˘j bratr Egill.
			};
	AI_Output			(self, other, "DIA_Ehnim_HALLO_12_03"); //Uû tady na farmÏ pracuju pro Akila nÏkolik let.

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

	description	 = 	"Jak jdou polnÌ pr·ce?";
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
	AI_Output			(other, self, "DIA_Ehnim_FELDARBEIT_15_00"); //Jak jdou polnÌ pr·ce?
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_01"); //Chceö pomoct? T·mhle je dalöÌ motyka. Vezmi si ji a vyraz na pole.
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_02"); //Ale mÏl by ses mÌt na pozoru p¯ed polnÌmi ök˘dci. Utrhnou ti ruku, ani nemrkneö.

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

	description	 = 	"ProË s tÏmi ök˘dci nÏco neudÏl·te?";
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
	AI_Output			(other, self, "DIA_Ehnim_FELDRAEUBER_15_00"); //ProË s tÏmi ök˘dci nÏco neudÏl·te?
	AI_Output			(self, other, "DIA_Ehnim_FELDRAEUBER_12_01"); //Zabil uû jsem jich vÌc, neû dok·ûu spoËÌtat. Jedinej problÈm je, ûe zase p¯ijdou dalöÌ.

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

	description	 = 	"Tv˘j bratr mi ¯Ìkal to samÈ.";
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
	AI_Output			(other, self, "DIA_Ehnim_STREIT1_15_00"); //Tv˘j bratr mi ¯Ìkal to samÈ.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_01"); //Co? Ten sralbotka? Vûdycky se vytratÌ hned, jak se ty bestie objevÌ na naöem pozemku.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_02"); //NemÏl by ¯Ìkat takov˝ nesmysly.
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

	description	 = 	"Tv˘j bratr si myslÌ, ûe se akor·t vytahujeö.";
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
	AI_Output			(other, self, "DIA_Ehnim_STREIT3_15_00"); //Tv˘j bratr si myslÌ, ûe se akor·t vytahujeö.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_01"); //Co? To m· v·ûnÏ odvahu tohle ¯Ìct?
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_02"); //RadÏj by si mÏl d·vat pozor, neû mu uötÏd¯Ìm po¯·dnou lekci.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_03"); //Tak mu to bÏû ¯Ìct.
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

	description	 = 	"M·m dojem, ûe byste se mÏli oba trochu zklidnit.";
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
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_15_00"); //M·m dojem, ûe byste se mÏli oba trochu zklidnit.
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_01"); //Ten bastard to jeötÏ nevzdal, co?
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_02"); //J· ho roztrhnu. ÿekni mu to.

	Info_ClearChoices	(DIA_Ehnim_STREIT5);

	Info_AddChoice	(DIA_Ehnim_STREIT5, "DÏlej si, co chceö. Odch·zÌm.", DIA_Ehnim_STREIT5_gehen );
	Info_AddChoice	(DIA_Ehnim_STREIT5, "ProË mu to ne¯ekneö s·m?", DIA_Ehnim_STREIT5_Attack );


};
func void DIA_Ehnim_STREIT5_Attack ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_Attack_15_00"); //ProË mu to ne¯ekneö s·m?
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_Attack_12_01"); //To p¯esnÏ udÏl·m.

	AI_StopProcessInfos (self);

	DIA_Ehnim_STREIT5_noPerm = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Egill, AR_NONE, 0);
	
	B_GivePlayerXP (XP_EgillEhnimStreit);
	
};

func void DIA_Ehnim_STREIT5_gehen ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_gehen_15_00"); //DÏlej si, co chceö. Odch·zÌm.
	AI_Output			(self ,other, "DIA_Ehnim_STREIT5_gehen_12_01"); //Jo, jen se rychle ztraù.
	
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
	AI_Output			(self, other, "DIA_Ehnim_PERMKAP1_12_00"); //Chceö dÏlat dalöÌ problÈmy? M·m dojem, ûe bude lepöÌ, kdyû se hned ztratÌö.

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
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_00"); //Ty jsi tu JEäTÃ.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_01"); //Vypad· to tak. Po¯·d vytoËenej?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_02"); //Nic se nedÏje, zapomeÚ na to. ÿekni, byl jsi poslednÌ dobou na LobartovÏ farmÏ?
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_03"); //Moûn·. ProË?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_04"); //¡le, nic d˘leûit˝ho. Jen jsem chtÏl mluvit s Vinem o jeho palÌrnÏ.
	
	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Pr·vÏ teÔ nem·m Ëas.", DIA_Ehnim_MoleRatFett_nein );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "PalÌrna? Jak· palÌrna?", DIA_Ehnim_MoleRatFett_was );

	if (Npc_IsDead(Vino))
	{
		Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Vino je mrtv˝.", DIA_Ehnim_MoleRatFett_tot );
	};

};
func void DIA_Ehnim_MoleRatFett_tot ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_tot_15_00"); //Vino je mrtv˝.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_tot_12_01"); //Proboha. No nic. Tak to se ned· nic dÏlat.

};

func void DIA_Ehnim_MoleRatFett_was ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_15_00"); //O palÌrnÏ? O jakÈ palÌrnÏ?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_01"); //Eh. Asi jsem to nemÏl ¯Ìkat. Vino byl na to svÈ malÈ tajemstvÌ vûdycky hodnÏ citliv˝.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_02"); //Ale teÔ jsem si to nechal vyklouznout. Tam vzadu v lese si Vino za¯Ìdil tajnou palÌrnu.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_03"); //Ned·vno mÏ û·dal o nÏco, ËÌm by mohl promazat padacÌ m¯Ìû.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_04"); //V poslednÌ dobÏ hodnÏ pröelo a zaËala ho zlobit rez. TeÔ je navij·k zaseknut˝ a nikdo uû se tam nedostane. To jsme v pÏkn˝ bryndÏ.

	Log_CreateTopic (TOPIC_FoundVinosKellerei, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FoundVinosKellerei, LOG_RUNNING);
	B_LogEntry (TOPIC_FoundVinosKellerei,"Podle Ehnima se Vino st·le ukr˝v· v lesÌch poblÌû Akilova statku. Ale mechanismus dve¯Ì je zad¯en˝ a dokud jej nenamaûu rysËÌm s·dlem, dovnit¯ se nedostanu."); 
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "A? M·ö nÏjak˝ mazivo?", DIA_Ehnim_MoleRatFett_was_Fett );
};
func void DIA_Ehnim_MoleRatFett_was_Fett ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_15_00"); //A? M·ö nÏjak˝ mazivo?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_12_01"); //Jo, jasnÏ. NejlepöÌ, co se tu d· sehnat. RysËÌ s·dlo. P¯Ìöern· vÏc, to ti povÌm. Taky se pouûÌv· na promaz·nÌ lodnÌch dÏl.
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Prodej mi ten tuk.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill );

};
var int Ehnim_MoleRatFettOffer;
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00"); //Prodej mi to s·dlo.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01"); //To nebude levn˝, k·mo. V tomhle kraji to je zatracenÏ vz·cn· vÏc.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02"); //Kolik?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03"); //Mmh. 100 zlat˝ch?
	Ehnim_MoleRatFettOffer = 100;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "To je p¯Ìliö.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Dohodnuto.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00"); //Dohodnuto.

	if (B_GiveInvItems (other, self, ItMi_Gold,Ehnim_MoleRatFettOffer))
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01"); //Dobr·. Tady to m·ö.
			
			if (Npc_HasItems (self,ItMi_Moleratlubric_MIS))
			{
				B_GiveInvItems (self, other, ItMi_Moleratlubric_MIS, 1);
				
				if (Npc_IsDead(Vino) == FALSE)
					{
						AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02"); //(pro sebe) ZatracenÏ. Vino mÏ zabije.
					};					
			}
			else
			{
				AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03"); //Sakra, kam jsme se to dostali? To je zatracenÏ mrzut· vÏc. Tak fajn, promiÚ. Jak se zd·, uû to nem·m. Vem si sv˝ prachy zp·tky.
				B_GiveInvItems (self, other, ItMi_Gold,Ehnim_MoleRatFettOffer);
				
				if (Npc_IsDead(Egill) == FALSE)
					{
						AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04"); //VsadÌm se, ûe to m˘j br·cha udÏl· znovu. Ten bastard.
						AI_StopProcessInfos (self);
						other.aivar[AIV_INVINCIBLE] = FALSE;
						B_Attack (self, Egill, AR_NONE, 0);
					};
			};
		}
	else
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05"); //No to je bezvadn˝. Nejd¯Ìv chceö udÏlat velkej köeft a pak nem·ö dost prach˘. Ztraù se.
		};
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00"); //To je p¯Ìliö.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01"); //Fajn, fajn. Tak teda 70 zlat˝ch. Ale to je moje poslednÌ nabÌdka.
	Ehnim_MoleRatFettOffer = 70;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "To je jeötÏ po¯·d moc.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Dohodnuto.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_immernoch_15_00"); //To je jeötÏ po¯·d moc.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_immernoch_12_01"); //(naötvanÏ) Tak si trhni. MÏj se.
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_nein ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_nein_15_00"); //Pr·vÏ teÔ nem·m Ëas.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_nein_12_01"); //Nenech se zdrûovat, chlape.
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
	AI_Output			(self, other, "DIA_Ehnim_PERMKAP3_12_00"); //TeÔ nem·m Ëas.
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
























