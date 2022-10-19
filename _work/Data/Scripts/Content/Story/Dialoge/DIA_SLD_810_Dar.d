// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Dar_EXIT (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 999;
	condition   = DIA_Dar_EXIT_Condition;
	information = DIA_Dar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Dar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************

INSTANCE DIA_Dar_Hallo (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 1;
	condition   = DIA_Dar_Hallo_Condition;
	information = DIA_Dar_Hallo_Info;
	permanent   = FALSE;
	description = "Co tam palisz?";
};

FUNC INT DIA_Dar_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Dar_Hallo_15_00"); //Co tam palisz?
	AI_Output (self, other, "DIA_Dar_Hallo_03_01"); //Chcesz bucha?
	
	Info_ClearChoices (DIA_Dar_Hallo);
	Info_AddChoice (DIA_Dar_Hallo, "Nie.", DIA_Dar_Hallo_Nein);
	Info_AddChoice (DIA_Dar_Hallo, "Jasne.", DIA_Dar_Hallo_Ja);
};

func void DIA_Dar_Hallo_Ja()
{
	AI_Output (other, self, "DIA_Dar_Hallo_Ja_15_00"); //Jasne.
	CreateInvItem (other, itmi_joint);
	B_UseItem (other, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Hallo_Ja_03_01"); //Niez³e, co?
	AI_Output (other, self, "DIA_Dar_Hallo_Ja_15_02"); //Sk¹d masz towar?
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Hallo_Ja_03_03"); //Mam swoje Ÿród³a.
	Info_ClearChoices (DIA_Dar_Hallo);	
};

func void DIA_Dar_Hallo_Nein()
{
	AI_Output (other, self, "DIA_Dar_Hallo_Nein_15_00"); //Nie.
	Info_ClearChoices (DIA_Dar_Hallo);	
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
var int Dar_einmal; 

INSTANCE DIA_Dar_PERM (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 2;
	condition   = DIA_Dar_PERM_Condition;
	information = DIA_Dar_PERM_Info;
	permanent   = TRUE;
	description = "Czy poza paleniem masz jeszcze jakieœ zajêcie?";
};

FUNC INT DIA_Dar_PERM_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_Hallo))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_PERM_Info()
{
	AI_Output (other, self, "DIA_Dar_PERM_15_00"); //Czy poza paleniem masz jeszcze jakieœ zajêcie?
	
	if (Dar_LostAgainstCipher == TRUE)
	&& (Dar_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Dar_PERM_03_01"); //Tak, czasami pozwalam siê pobiæ jakimœ pal¹cym ziele œmieciom...
		Dar_einmal = TRUE;
	}
		else //DEFAULT
	{
		AI_Output (self, other, "DIA_Dar_PERM_03_02"); //Nie w tej chwili.
	};
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************

INSTANCE DIA_Dar_WannaJoin (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 3;
	condition   = DIA_Dar_WannaJoin_Condition;
	information = DIA_Dar_WannaJoin_Info;
	permanent   = FALSE;
	description = "Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?";
};

FUNC INT DIA_Dar_WannaJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_Hallo))
	&& (other.guild == GIL_NONE)
	&& (Dar_LostAgainstCipher == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Dar_WannaJoin_15_00"); //Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?
	AI_Output (self, other, "DIA_Dar_WannaJoin_03_01"); //A kogo to obchodzi...
};

// ************************************************************
// 			  				DuDieb
// ************************************************************

INSTANCE DIA_Dar_DuDieb (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 4;
	condition   = DIA_Dar_DuDieb_Condition;
	information = DIA_Dar_DuDieb_Info;
	permanent   = FALSE;
	description = "Cipher powiedzia³ mi, ¿e ktoœ mu ukrad³ paczkê bagiennego ziela.";
};

FUNC INT DIA_Dar_DuDieb_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat)) //von Diebstahl gehört
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_DuDieb_Info()
{
	AI_Output (other, self, "DIA_Dar_DuDieb_15_00"); //Cipher powiedzia³ mi, ¿e ktoœ mu ukrad³ paczkê bagiennego ziela.
	AI_Output (self, other, "DIA_Dar_DuDieb_03_01"); //(œmiech)
	AI_Output (other, self, "DIA_Dar_DuDieb_15_02"); //Wiesz coœ mo¿e na ten temat?
	AI_Output (self, other, "DIA_Dar_DuDieb_03_03"); //Nie.
	
	Dar_Verdacht = TRUE;
};

// ************************************************************
// 			  				WoPaket
// ************************************************************

INSTANCE DIA_Dar_WoPaket (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 4;
	condition   = DIA_Dar_WoPaket_Condition;
	information = DIA_Dar_WoPaket_Info;
	permanent   = TRUE;
	description = "Gdzie jest paczka?";
};

FUNC INT DIA_Dar_WoPaket_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_DuDieb))
	&& (Dar_Dieb == FALSE)
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_WoPaket_Info()
{
	AI_Output (other, self, "DIA_Dar_WoPaket_15_00"); //Gdzie jest paczka?
		
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{	
		AI_Output (self, other, "DIA_Dar_WoPaket_03_01"); //Dobra, ju¿ dobra. Sprzeda³em to jakiemuœ obdartusowi w mieœcie.
		AI_Output (self, other, "DIA_Dar_WoPaket_03_02"); //To by³o w porcie. Nie pamiêtam, jak wygl¹da³.
		AI_Output (other, self, "DIA_Dar_WoPaket_15_03"); //Czy¿byœ znowu domaga³ siê lania?
		AI_Output (self, other, "DIA_Dar_WoPaket_03_04"); //Powa¿nie cz³owieku, by³em kompletnie najarany. Nie mam zielonego pojêcia, jak wygl¹da³ ten goœæ.
		AI_Output (self, other, "DIA_Dar_WoPaket_03_05"); //Pamiêtam tylko tyle, ¿e by³o to w porcie niedaleko miejsca, gdzie buduj¹ ³odzie.
	
		Dar_Dieb = TRUE;
		B_LogEntry (Topic_CipherPaket,"Dar przyzna³ siê do kradzie¿y paczki ziela. Sprzeda³ j¹ w dzielnicy portowej Khorinis, niedaleko stoczni.");
	}
	else
	{
		AI_Output (self, other, "DIA_Dar_WoPaket_03_06"); //Ja tam nic nie wiem.
	};
};

// ************************************************************
// 			  				AufsMaul
// ************************************************************

INSTANCE DIA_Dar_AufsMaul (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 5;
	condition   = DIA_Dar_AufsMaul_Condition;
	information = DIA_Dar_AufsMaul_Info;
	permanent   = FALSE;
	description = "Wyduszê to z ciebie!";
};

FUNC INT DIA_Dar_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_DuDieb))
	&& (Dar_Dieb == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_AufsMaul_Info()
{
	AI_Output (other, self, "DIA_Dar_AufsMaul_15_00"); //Wyduszê to z ciebie!
	AI_Output (self, other, "DIA_Dar_AufsMaul_03_01"); //Spokojnie. Jestem zbyt upalony, ¿eby z tob¹ walczyæ.
	B_GiveInvItems (self, other, itmi_joint, 1);
	AI_Output (self, other, "DIA_Dar_AufsMaul_03_02"); //Najpierw weŸ sobie porz¹dnego macha.
};

// ************************************************************
// 			  			Kameradenschwein
// ************************************************************

INSTANCE DIA_Dar_Kameradenschwein (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 1;
	condition   = DIA_Dar_Kameradenschwein_Condition;
	information = DIA_Dar_Kameradenschwein_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Dar_Kameradenschwein_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		self.aivar[AIV_LastFightComment] == FALSE; //geht NUR bei ECHTER Important-Info!
		return TRUE;
	};
};

FUNC VOID DIA_Dar_Kameradenschwein_Info()
{
	AI_Output (self, other, "DIA_Dar_Kameradenschwein_03_00"); //Nie potrafisz trzymaæ jêzyka za zêbami? Powiedzia³eœ Cipherowi, ¿e ukrad³em jego ziele!
	if (Npc_KnowsInfo (other, DIA_Dar_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Dar_Kameradenschwein_03_01");  //Jasne, ju¿ idê oddaæ na ciebie g³os.
	};
};

// ************************************************************
// 			  				Pilztabak
// ************************************************************

INSTANCE DIA_Dar_Pilztabak (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 6;
	condition   = DIA_Dar_Pilztabak_Condition;
	information = DIA_Dar_Pilztabak_Info;
	permanent   = FALSE;
	description	= "Czy kiedykolwiek próbowa³eœ grzybowego tytoniu?";
};

FUNC INT DIA_Dar_Pilztabak_Condition()
{
	if (Npc_HasItems (other, Itmi_Pilztabak) > 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_Pilztabak_Info()
{
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_00"); //Czy kiedykolwiek próbowa³eœ grzybowego tytoniu?
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_01"); //Brzmi interesuj¹co. Dawaj.
	B_GiveInvItems (other, self, Itmi_Pilztabak, 1);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_02"); //No dobrze, zaczynamy...
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_03"); //Czy kiedykolwiek pali³eœ ten towar?
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_04"); //Hm...
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_05"); //Tak czy nie?
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_06"); //Jestem ostatnio trochê zajêty...
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_07"); //O cholera!
	AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_08"); //Na œwiêtego Rhobara!
	AI_PlayAni (self, "T_HEASHOOT_2_STAND");
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_09"); //Ten towar jest za mocny! Lepiej go nawet nie próbuj!
	B_GivePlayerXP (XP_Ambient);
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

INSTANCE DIA_Dar_KAP3_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP3_EXIT_Condition;
	information	= DIA_Dar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
}; 
                      
FUNC INT DIA_Dar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_KAP3_EXIT_Info()
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

INSTANCE DIA_Dar_KAP4_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP4_EXIT_Condition;
	information	= DIA_Dar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orcring
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_ORCRING		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_ORCRING_Condition;
	information	 = 	DIA_Dar_ORCRING_Info;

	description	 = 	"Zdaje siê, ¿e brakuje tu kilku najemników.";
};

func int DIA_Dar_ORCRING_Condition ()
{
	if (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Dar_ORCRING_Info ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_15_00"); //Zdaje siê, ¿e brakuje tu kilku najemników.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_01"); //Jasne. To prawda. Sylvio jest ca³e mile st¹d i zabra³ ze sob¹ po³owê za³ogi.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_02"); //Kogo to obchodzi? Z Lee i jego ch³opakami mam szansê staæ siê naprawdê kimœ. Potrzebujê tylko kopa.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_03"); //Gdybym zdo³a³ udowodniæ Lee, ¿e jestem naprawdê twardym facetem, mo¿e nawet mianowa³by mnie jednym ze swoich ochroniarzy.

	Info_ClearChoices	(DIA_Dar_ORCRING);
	Info_AddChoice	(DIA_Dar_ORCRING, "To mnie nie dotyczy.", DIA_Dar_ORCRING_no );
	Info_AddChoice	(DIA_Dar_ORCRING, "Ty? Twardzielem?", DIA_Dar_ORCRING_necken );
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice	(DIA_Dar_ORCRING, "Jak mia³oby to niby wygl¹daæ?", DIA_Dar_ORCRING_wie );
	};
};

func void DIA_Dar_ORCRING_necken ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_15_00"); //Ty? Twardzielem?
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_01"); //Zamknij siê. Kim ty w ogóle jesteœ?
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_02"); //Pó³g³ówek z miasta. Gdyby ka¿dy by³ taki jak ty, to...
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_03"); //By³eœ tu tylko parê dni, a ju¿ wymiêkasz.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_04"); //Kogo próbujesz przestraszyæ tymi magicznymi bredniami? Chyba nie mnie?
		}; 
	

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_05"); //W³aœciwie, jak siê tak nad tym zastanowiæ, to roz³upanie twojej czaszki z pewnoœci¹ zapewni³oby mi szacunek wœród ch³opaków Lee.

		Info_ClearChoices	(DIA_Dar_ORCRING);
		Info_AddChoice	(DIA_Dar_ORCRING, "Nie mam czasu na te bzdury.", DIA_Dar_ORCRING_necken_no );
		Info_AddChoice	(DIA_Dar_ORCRING, "Dobrze. Tylko spróbuj.", DIA_Dar_ORCRING_necken_schlagen );
	}
	else
	{
		AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_06"); //Tylko poczekaj. Znajdê jakiœ sposób, ¿eby zrobiæ wra¿enie na Lee.
	};
};
var int Dar_FightAgainstPaladin;
func void DIA_Dar_ORCRING_necken_schlagen ()
{
	Dar_FightAgainstPaladin = TRUE;
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_schlagen_15_00"); //Dobrze. Tylko spróbuj.
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_schlagen_03_01"); //Och, nie mogê siê doczekaæ.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Dar_ORCRING_necken_no ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_no_15_00"); //Nie mam czasu na te bzdury.
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_no_03_01"); //No tak. Rycerz sprawiedliwoœci w lœni¹cej zbroi, zapomnia³em. Szkoda, myœla³em, ¿e staæ ciê na coœ wiêcej.
	AI_StopProcessInfos (self);
};

func void DIA_Dar_ORCRING_wie ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_wie_15_00"); //Jak mia³oby to niby wygl¹daæ?
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_01"); //Tak do koñca to nie wiem. Jakieœ orkowe trofeum nie by³oby najgorsze...
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_02"); //Jakieœ insygnia orkowych przywódców albo coœ w tym stylu. Sztandar, naramiennik, pierœcieñ, no wiesz, o co mi chodzi.
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_03"); //To chyba oczywiste, ¿e nic poœledniejszego nie wchodzi w rachubê.
	
	Log_CreateTopic (TOPIC_Dar_BringOrcEliteRing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Dar_BringOrcEliteRing, LOG_RUNNING);
	B_LogEntry (TOPIC_Dar_BringOrcEliteRing,"Dar chce zyskaæ szacunek najemników. Dlatego potrzebuje jakiegoœ orkowego trofeum - sztandaru, naramiennika, pierœcienia..."); 

	MIS_Dar_BringOrcEliteRing = LOG_RUNNING;
	Info_ClearChoices	(DIA_Dar_ORCRING);
};

func void DIA_Dar_ORCRING_no ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_no_15_00"); //To mnie nie dotyczy.
	AI_Output			(self, other, "DIA_Dar_ORCRING_no_03_01"); //Oczywiœcie. By³bym naprawdê zdumiony.
	Info_ClearChoices	(DIA_Dar_ORCRING);
};

///////////////////////////////////////////////////////////////////////
//	Info FightagainstPalOver
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_FIGHTAGAINSTPALOVER		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_FIGHTAGAINSTPALOVER_Condition;
	information	 = 	DIA_Dar_FIGHTAGAINSTPALOVER_Info;
	important	 = 	TRUE;
};

func int DIA_Dar_FIGHTAGAINSTPALOVER_Condition ()
{
	if 	(Dar_FightAgainstPaladin == TRUE)
	&&	((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
				return TRUE;
		};
};

func void DIA_Dar_FIGHTAGAINSTPALOVER_Info ()
{
	AI_Output			(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_00"); //No có¿, chyba nie zyskam uznania Lee, ponownie wdaj¹c siê z tob¹ w walkê.
	AI_Output			(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_01"); //Nie potrzebujê wrogów. Wiêc mo¿e po prostu zapomnijmy o tych bzdurach, co ty na to?
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info BringOrcEliteRing
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_BRINGORCELITERING		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_BRINGORCELITERING_Condition;
	information	 = 	DIA_Dar_BRINGORCELITERING_Info;

	description	 = 	"Mam tutaj orkowe trofeum, na którym ci zale¿a³o.";
};

func int DIA_Dar_BRINGORCELITERING_Condition ()
{
	if (MIS_Dar_BringOrcEliteRing == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	&& (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
				return TRUE;
		};
};

func void DIA_Dar_BRINGORCELITERING_Info ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_15_00"); //Mam tutaj orkowe trofeum, na którym ci zale¿a³o.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_03_01"); //Co mi przynios³eœ?
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_15_02"); //Pierœcieñ orkowego herszta.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_03_03"); //Có¿, w takim wypadku... Co za to chcesz?
	MIS_Dar_BringOrcEliteRing = LOG_SUCCESS;

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);

	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Co mo¿esz mi zaoferowaæ?", DIA_Dar_BRINGORCELITERING_was );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Daj mi z³oto.", DIA_Dar_BRINGORCELITERING_geld );
	};
		
};
func void DIA_Dar_BRINGORCELITERING_geld ()
{
	
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_00"); //Daj mi z³oto.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_01"); //Hm. 600 z³otych monet?
		AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_02"); //O co chodzi?
	};

	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_03"); //Dobrze. Dam ci za niego 1200 z³otych monet.
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_04"); //WeŸ pieni¹dze albo zatrzymaj sobie pierœcieñ.
	};
	
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "To za ma³o.", DIA_Dar_BRINGORCELITERING_geld_no );
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Umowa stoi.", DIA_Dar_BRINGORCELITERING_geld_ok );

};
func void DIA_Dar_BRINGORCELITERING_geld_ok ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_ok_15_00"); //Umowa stoi. Oto pierœcieñ.
	B_GiveInvItems 		(other, self, ItRi_OrcEliteRing, 1);					
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_ok_03_01"); //Dziêki. Ju¿ siê nie mogê doczekaæ, co powiedz¹ na to inni.

	CreateInvItems 		(self, ItMi_Gold, 1200);									
	B_GiveInvItems 		(self, other, ItMi_Gold, 1200);					
	B_GivePlayerXP 		(XP_Dar_BringOrcEliteRing);

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_geld_no ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_no_15_00"); //To za ma³o.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_no_03_01"); //A ja uwa¿am, ¿e to za du¿o. Bez obrazy, ale jak dla mnie to jakiœ podejrzany interes.
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_was ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_was_15_00"); //Co mo¿esz mi zaoferowaæ?
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_03_01"); //Mo¿esz przyj¹æ pieni¹dze albo ten amulet, który... hm, powiedzmy, ¿e wpad³ mi w rêce jakiœ czas temu.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_03_02"); //Podnosi zrêcznoœæ. Wypróbowa³em go ju¿ parê razy.

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Daj mi z³oto.", DIA_Dar_BRINGORCELITERING_geld );
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Daj mi amulet.", DIA_Dar_BRINGORCELITERING_was_am );
};

func void DIA_Dar_BRINGORCELITERING_was_am ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_was_am_15_00"); //Daj mi amulet.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_01"); //Jasne. Mi³ej zabawy. A teraz poproszê pierœcieñ.

	B_GiveInvItems 		(other, self, ItRi_OrcEliteRing, 1);					
	CreateInvItems 		(self, ItAm_Dex_01, 1);									
	B_GiveInvItems 		(self, other, ItAm_Dex_01, 1);					
	B_GivePlayerXP 		(XP_Dar_BringOrcEliteRing);

	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_02"); //Interesy z tob¹ to sama przyjemnoœæ.
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);

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

INSTANCE DIA_Dar_KAP5_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP5_EXIT_Condition;
	information	= DIA_Dar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Dar_KAP6_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP6_EXIT_Condition;
	information	= DIA_Dar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dar_PICKPOCKET (C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 900;
	condition	= DIA_Dar_PICKPOCKET_Condition;
	information	= DIA_Dar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Dar_PICKPOCKET_Condition()
{
	C_Beklauen (67, 35);
};
 
FUNC VOID DIA_Dar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dar_PICKPOCKET);
	Info_AddChoice		(DIA_Dar_PICKPOCKET, DIALOG_BACK 		,DIA_Dar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dar_PICKPOCKET_DoIt);
};

func void DIA_Dar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dar_PICKPOCKET);
};
	
func void DIA_Dar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dar_PICKPOCKET);
};












































