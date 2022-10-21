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
	description = "Was rauchst du da?";
};

FUNC INT DIA_Dar_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Dar_Hallo_15_00"); //Was rauchst du da?
	AI_Output (self, other, "DIA_Dar_Hallo_03_01"); //Willst du mal ziehen?
	
	Info_ClearChoices (DIA_Dar_Hallo);
	Info_AddChoice (DIA_Dar_Hallo, "Nein.", DIA_Dar_Hallo_Nein);
	Info_AddChoice (DIA_Dar_Hallo, "Klar.", DIA_Dar_Hallo_Ja);
};

func void DIA_Dar_Hallo_Ja()
{
	AI_Output (other, self, "DIA_Dar_Hallo_Ja_15_00"); //Klar.
	CreateInvItem (other, itmi_joint);
	B_UseItem (other, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Hallo_Ja_03_01"); //Nicht schlecht, was?
	AI_Output (other, self, "DIA_Dar_Hallo_Ja_15_02"); //Wo hast du das Zeug her?
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Hallo_Ja_03_03"); //(grinst) Ich hab so meine Quellen.
	Info_ClearChoices (DIA_Dar_Hallo);	
};

func void DIA_Dar_Hallo_Nein()
{
	AI_Output (other, self, "DIA_Dar_Hallo_Nein_15_00"); //Nein.
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
	description = "Machst du noch was anderes, außer zu rauchen?";
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
	AI_Output (other, self, "DIA_Dar_PERM_15_00"); //Machst du noch was anderes, außer zu rauchen?
	
	if (Dar_LostAgainstCipher == TRUE)
	&& (Dar_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Dar_PERM_03_01"); //(sarkastisch) Manchmal lasse ich mich auch von rachsüchtigen Sumpfkraut-Junkies zusammenschlagen.
		Dar_einmal = TRUE;
	}
		else //DEFAULT
	{
		AI_Output (self, other, "DIA_Dar_PERM_03_02"); //Zurzeit nicht.
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
	description = "Ich will mich den Söldnern anschließen. Hast du was dagegen?";
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
	AI_Output (other, self, "DIA_Dar_WannaJoin_15_00"); //Ich will mich den Söldnern anschließen. Hast du was dagegen?
	AI_Output (self, other, "DIA_Dar_WannaJoin_03_01"); //Mir egal.
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
	description = "Cipher hat mir erzählt, ihm wäre ein Paket Sumpfkraut gestohlen worden ...";
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
	AI_Output (other, self, "DIA_Dar_DuDieb_15_00"); //Cipher hat mir erzählt, ihm wäre ein Paket Sumpfkraut gestohlen worden ...
	AI_Output (self, other, "DIA_Dar_DuDieb_03_01"); //(lacht verhalten und debil)
	AI_Output (other, self, "DIA_Dar_DuDieb_15_02"); //Hast du was damit zu tun?
	AI_Output (self, other, "DIA_Dar_DuDieb_03_03"); //(superkurz) Nein.
	
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
	description = "Wo ist das Paket!?";
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
	AI_Output (other, self, "DIA_Dar_WoPaket_15_00"); //(droht) Wo ist das Paket!?
		
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{	
		AI_Output (self, other, "DIA_Dar_WoPaket_03_01"); //Okay, okay, okay! Ich hab's an irgendeinen Penner in der Stadt verhökert.
		AI_Output (self, other, "DIA_Dar_WoPaket_03_02"); //Es war am Hafen. Ich weiß nicht mehr, wie er aussah.
		AI_Output (other, self, "DIA_Dar_WoPaket_15_03"); //Du brauchst doch wohl nicht noch mal Schläge?
		AI_Output (self, other, "DIA_Dar_WoPaket_03_04"); //Ehrlich, Mann, ich war total dicht. Hab keine Ahnung mehr, wie der Kerl aussah.
		AI_Output (self, other, "DIA_Dar_WoPaket_03_05"); //Es war am Hafen in der Nähe des Bootsbauers. An mehr kann ich mich nicht erinnern.
	
		Dar_Dieb = TRUE;
		B_LogEntry (Topic_CipherPaket,"Dar hat zugegeben, das er das Krautpaket gestohlen hat. Er hat es im Hafenviertel von Khorinis verkauft, in der Nähe des Bootsbauers.");
	}
	else
	{
		AI_Output (self, other, "DIA_Dar_WoPaket_03_06"); //Was weiß ich?
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
	description = "Ich prügel es aus dir raus!";
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
	AI_Output (other, self, "DIA_Dar_AufsMaul_15_00"); //Ich prügel es aus dir raus!
	AI_Output (self, other, "DIA_Dar_AufsMaul_03_01"); //Entspann dich. Ich bin viel zu dicht, um mich mit dir zu prügeln!
	B_GiveInvItems (self, other, itmi_joint, 1);
	AI_Output (self, other, "DIA_Dar_AufsMaul_03_02"); //Hier, nimm erstmal 'nen tiefen Zug.
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
	AI_Output (self, other, "DIA_Dar_Kameradenschwein_03_00"); //Kameradenschwein! Du hast Cipher erzählt, dass ich sein Kraut genommen habe!
	if (Npc_KnowsInfo (other, DIA_Dar_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Dar_Kameradenschwein_03_01");  //Ich werde den Teufel tun, für dich zu stimmen.
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
	description	= "Hast du schon mal Pilztabak probiert?";
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
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_00"); //Hast du schon mal Pilztabak probiert?
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_01"); //Klingt interessant. Immer her damit.
	B_GiveInvItems (other, self, Itmi_Pilztabak, 1);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_02"); //Dann wollen wir mal ...
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_03"); //Hast du das Zeug schon SELBER geraucht?
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_04"); //Nun ...
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_05"); //Hast du oder hast du nicht?
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_06"); //Ich hatte viel zu tun ...
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_07"); //Ach du Scheiße!
	AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_08"); //Heiliger Rhobar!
	AI_PlayAni (self, "T_HEASHOOT_2_STAND");
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_09"); //Das Zeug ist echt zu krass! Probier das bloß nicht!
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

	description	 = 	"Ich habe den Eindruck, hier fehlen einige Söldner.";
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
	AI_Output			(other, self, "DIA_Dar_ORCRING_15_00"); //Ich habe den Eindruck, hier fehlen einige Söldner.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_01"); //Klar. Das ist auch so. Sylvio ist über alle Berge und hat die halbe Mannschaft mitgenommen.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_02"); //Mir egal. So hab ich eine größere Chance, bei Lees Jungs was zu werden. Mir fehlt nur noch der Knaller.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_03"); //Wenn ich einen Beweis erbringen könnte, dass ich ein richtig harter Kerl bin, könnte ich vielleicht sogar zu Lees Leibgarde aufsteigen.

	Info_ClearChoices	(DIA_Dar_ORCRING);
	Info_AddChoice	(DIA_Dar_ORCRING, "Interessiert mich nicht.", DIA_Dar_ORCRING_no );
	Info_AddChoice	(DIA_Dar_ORCRING, "Harter Kerl? Du?", DIA_Dar_ORCRING_necken );
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice	(DIA_Dar_ORCRING, "Wie soll das aussehen?", DIA_Dar_ORCRING_wie );
	};
};

func void DIA_Dar_ORCRING_necken ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_15_00"); //Harter Kerl? Du?
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_01"); //(verärgert) Ach, komm, halt die Schnauze. Wer bist du denn schon?
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_02"); //So'n aufgeblasener Pinsel aus der Stadt. Ihr Blechkameraden habt doch nichts drauf.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_03"); //Gerade mal ein paar Tage bei uns und schon haste 'ne große Fresse.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_04"); //Wem willst du denn mit deinem dämlichen magischen Firlefanz Angst machen? Mir jedenfalls nicht.
		}; 
	

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_05"); //Wenn ich es mir recht überlege, dir den Schädel zu spalten, wäre genau das, was mir 'ne Menge Respekt bei Lees Jungs verschaffen würde.

		Info_ClearChoices	(DIA_Dar_ORCRING);
		Info_AddChoice	(DIA_Dar_ORCRING, "Ich hab´ keine Zeit für so einen Blödsinn.", DIA_Dar_ORCRING_necken_no );
		Info_AddChoice	(DIA_Dar_ORCRING, "Ok. Versuch´s.", DIA_Dar_ORCRING_necken_schlagen );
	}
	else
	{
		AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_06"); //Wart's mal ab. Ich werde schon noch das passende finden, um Lee zu beeindrucken.
	};
};
var int Dar_FightAgainstPaladin;
func void DIA_Dar_ORCRING_necken_schlagen ()
{
	Dar_FightAgainstPaladin = TRUE;
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_schlagen_15_00"); //Ok. Versuch's.
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_schlagen_03_01"); //Da bin ja mal gespannt.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Dar_ORCRING_necken_no ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_no_15_00"); //Ich hab keine Zeit für so einen Blödsinn.
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_no_03_01"); //Ach ja. Der strahlende Ritter der Gerechtigkeit, ich vergaß. Schade. Ich dachte, du hättest mehr Mumm in den Knochen.
	AI_StopProcessInfos (self);
};

func void DIA_Dar_ORCRING_wie ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_wie_15_00"); //Wie soll das aussehen?
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_01"); //Ich weiß nicht genau. Irgendeine Orktrophäe wäre nicht so schlecht.
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_02"); //So was wie ein Zeichen der Orkischen Anführer oder so. Eine Standarte, ein Armreif oder Ring oder ähnliches.
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_03"); //Mit sehr viel weniger kann ich hier keinen Eindruck schinden. So viel ist schon mal klar.
	
	Log_CreateTopic (TOPIC_Dar_BringOrcEliteRing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Dar_BringOrcEliteRing, LOG_RUNNING);
	B_LogEntry (TOPIC_Dar_BringOrcEliteRing,"Dar will eine große Nummer bei den Söldnern werden. Er will eine Orktrophäe. Eine Standarte, ein Armreif oder Ring oder ähnliches."); 

	MIS_Dar_BringOrcEliteRing = LOG_RUNNING;
	Info_ClearChoices	(DIA_Dar_ORCRING);
};

func void DIA_Dar_ORCRING_no ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_no_15_00"); //Interessiert mich nicht.
	AI_Output			(self, other, "DIA_Dar_ORCRING_no_03_01"); //(verärgert) Natürlich nicht. Hätte mich auch gewundert.
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
	AI_Output			(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_00"); //Schon gut. Ich weiß, dass Lee nicht gerade erbaut ist, wenn ich mich weiter mit dir anlege.
	AI_Output			(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_01"); //Ich will mir hier schließlich keine Feinde machen. Also lassen wir den Unsinn, ok?
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

	description	 = 	"Ich habe die Orktrophäe, die du suchst.";
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
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_15_00"); //Ich habe die Orktrophäe, die du suchst.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_03_01"); //Was schleppst du mir denn da an?
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_15_02"); //Den Ring eines Orkischen Kriegsherrn.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_03_03"); //Das ist allerdings ... Was willst du dafür haben?
	MIS_Dar_BringOrcEliteRing = LOG_SUCCESS;

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);

	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Was kannst du mir anbieten?", DIA_Dar_BRINGORCELITERING_was );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Gib mir Geld.", DIA_Dar_BRINGORCELITERING_geld );
	};
		
};
func void DIA_Dar_BRINGORCELITERING_geld ()
{
	
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_00"); //Gib mir Gold.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_01"); //Mmh. 600 Goldmünzen?
		AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_02"); //Was hast du gesagt?
	};

	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_03"); //Ok. Ich geb dir 1200 Goldmünzen dafür.
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_04"); //Friss es oder behalt den Ring.
	};
	
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Das ist mir zu wenig.", DIA_Dar_BRINGORCELITERING_geld_no );
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Abgemacht.", DIA_Dar_BRINGORCELITERING_geld_ok );

};
func void DIA_Dar_BRINGORCELITERING_geld_ok ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_ok_15_00"); //Abgemacht. Hier hast du den Ring.
	B_GiveInvItems 		(other, self, ItRi_OrcEliteRing, 1);					
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_ok_03_01"); //Danke. Bin schon gespannt, was die anderen dazu sagen werden.

	CreateInvItems 		(self, ItMi_Gold, 1200);									
	B_GiveInvItems 		(self, other, ItMi_Gold, 1200);					
	B_GivePlayerXP 		(XP_Dar_BringOrcEliteRing);

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_geld_no ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_no_15_00"); //Das ist mir zu wenig.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_no_03_01"); //Und mir schon zu viel. Das Geschäft ist mir zu windig. Nix für ungut.
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_was ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_was_15_00"); //Was kannst du mir anbieten?
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_03_01"); //Entweder du nimmst Geld oder dieses Amulett, das ich ... nun, sagen wir, vor einiger Zeit erworben habe.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_03_02"); //Es verbessert deine Geschicklichkeit. Hab's selbst schon ausprobiert.

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Gib mir Geld.", DIA_Dar_BRINGORCELITERING_geld );
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Gib mir das Ammulett.", DIA_Dar_BRINGORCELITERING_was_am );
};

func void DIA_Dar_BRINGORCELITERING_was_am ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_was_am_15_00"); //Gib mir das Amulett.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_01"); //Alles klar. Viel Spaß damit. Und jetzt her mit dem Ring.

	B_GiveInvItems 		(other, self, ItRi_OrcEliteRing, 1);					
	CreateInvItems 		(self, ItAm_Dex_01, 1);									
	B_GiveInvItems 		(self, other, ItAm_Dex_01, 1);					
	B_GivePlayerXP 		(XP_Dar_BringOrcEliteRing);

	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_02"); //War mir ein Vergnügen.
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












































