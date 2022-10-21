// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Maria_EXIT   (C_INFO)
{
	npc         = BAU_910_Maria;
	nr          = 999;
	condition   = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Maria_Hallo		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 1;
	condition	= DIA_Maria_Hallo_Condition;
	information	= DIA_Maria_Hallo_Info;
	permanent  	= FALSE;
	description = "Kdo jsi?";
};

func int DIA_Maria_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Maria_Hallo_15_00"); //Kdo jsi?
	AI_Output (self, other, "DIA_Maria_Hallo_17_01"); //Jsem Onarova ûena, Maria.
	AI_Output (self, other, "DIA_Maria_Hallo_17_02"); //Co tady chceö?
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Umsehen		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 2;
	condition	= DIA_Maria_Umsehen_Condition;
	information	= DIA_Maria_Umsehen_Info;
	permanent  	= FALSE;
	description = "Jen jsem se tu chtÏl porozhlÈdnout...";
};

func int DIA_Maria_Umsehen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info ()
{
	AI_Output (other, self, "DIA_Maria_Umsehen_15_00"); //Jen jsem si to chtÏl tady prohlÈdnout.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_01"); //S tolika chlapama na farmÏ se teÔ nem˘ûu uvnit¯ domu moc zdrûovat.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_02"); //ProstÏ sem jen tak vpadli.
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Soeldner	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 3;
	condition	= DIA_Maria_Soeldner_Condition;
	information	= DIA_Maria_Soeldner_Info;
	permanent  	= FALSE;
	description = "ObtÏûujÌ tÏ ti ûold·ci?";
};

func int DIA_Maria_Soeldner_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info ()
{
	AI_Output (other, self, "DIA_Maria_Soeldner_15_00"); //ObtÏûujÌ tÏ ti ûold·ci?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_01"); //Hele, zapomeÚ na to, co jsem pr·vÏ ¯ekla - je tu teÔ mnohem bezpeËnÏji, co se ti chlapi objevili.
		}
	else
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_02"); //No, p¯inejmenöÌm je tu teÔ, co jsou tu ûold·ci, mnohem bezpeËnÏji.
		};

	AI_Output (self, other, "DIA_Maria_Soeldner_17_03"); //Dokud jsme tu byli sami, pokaûdÈ p¯iöla domobrana z mÏsta a sebrala naöi ˙rodu.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_04"); //Sebrali nejlepöÌ Ë·st ˙rody. A taky si vzali p·r ovcÌ. Nedali n·m za to v˘bec nic.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_05"); //NÏkte¯Ì z tÏch niËem˘ se tu dokonce odv·ûili kr·st.
	if (hero.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_06"); //NevysvÏtluj si to nijak zle, voj·ku. VÌm, ûe takovÌ nejsou vöichni.
		};	
};

// ************************************************************
// 							Mission
// ************************************************************
instance DIA_Maria_Mission	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 4;
	condition	= DIA_Maria_Mission_Condition;
	information	= DIA_Maria_Mission_Info;
	permanent  	= FALSE;
	description = "Tak co ti ukradli?";
};

func int DIA_Maria_Mission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Soeldner))
	&& (MIS_Maria_BringPlate != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info ()
{
	AI_Output (other, self, "DIA_Maria_Mission_15_00"); //Tak co ti ukradli?
	AI_Output (self, other, "DIA_Maria_Mission_17_01"); //VÏtöinou zlato a st¯Ìbro. Taky n·m sebrali svatebnÌ dar. Zlat˝ t·c.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Maria_Mission_17_02"); //VsadÌm se, ûe teÔ se na nÏm usazuje prach v truhle nÏjakÈho mizernÈho mÏstskÈho str·ûnÈho.
	};
	MIS_Maria_BringPlate = LOG_RUNNING;
};

// ************************************************************
// 							BringPlate
// ************************************************************
instance DIA_Maria_BringPlate	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 5;
	condition	= DIA_Maria_BringPlate_Condition;
	information	= DIA_Maria_BringPlate_Info;
	permanent  	= FALSE;
	description = "M·m u sebe zlat˝ t·c. NenÌ n·hodou tv˘j?";
};

func int DIA_Maria_BringPlate_Condition ()
{
	if (Npc_HasItems (other, ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info ()
{
	B_GiveInvItems (other, self, ItMi_MariasGoldPlate, 1);
	AI_Output (other, self, "DIA_Maria_BringPlate_15_00"); //M·m u sebe zlat˝ t·c. NenÌ n·hodou tv˘j?
	AI_Output (self, other, "DIA_Maria_BringPlate_17_01"); //Ano! To je on! TisÌcerÈ dÌky!
	
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP (XP_Maria_Teller);
};


// ************************************************************
// 							BringPlate
// ************************************************************
var int Maria_Belohnung;
// ---------------------

instance DIA_Maria_Belohnung	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 6;
	condition	= DIA_Maria_Belohnung_Condition;
	information	= DIA_Maria_Belohnung_Info;
	permanent  	= TRUE;
	description = "A co takhle nÏjakou odmÏnu?";
};

func int DIA_Maria_Belohnung_Condition ()
{
	if (MIS_Maria_BringPlate == LOG_SUCCESS)
	&& (Maria_Belohnung == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_15_00"); //A co takhle nÏjakou odmÏnu?
	
	
	if (other.guild == GIL_SLD)
	|| (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_01"); //Pracujeö pro mÈho manûela jako ûoldnÈ¯, ne?
		AI_Output (other, self, "DIA_Maria_Belohnung_15_02"); //Spr·vnÏ.
		AI_Output (self, other, "DIA_Maria_Belohnung_17_03"); //Kolik ti platÌ?
		B_Say_Gold (other, self, SOLD);
		AI_Output (self, other, "DIA_Maria_Belohnung_17_04"); //To tedy moc nenÌ. Zajdi za nÌm a ¯ekni mu, aù ti p¯id·.
		AI_Output (other, self, "DIA_Maria_Belohnung_15_05"); //A myslÌö, ûe to udÏl·?
		AI_Output (self, other, "DIA_Maria_Belohnung_17_06"); //VÌ, co by se stalo, kdyby ne. VÏ¯ mi.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_07"); //Chceö se tady na farmÏ nechat najmout jako ûold·k?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, "Ne - v·ûnÏ ne.", DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, "Ano.", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output (self, other, "DIA_Maria_Belohnung_17_08"); //Tady, vezmi si to. ZaslouûÌö si to.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_Gold_15_00"); //Ne - v·ûnÏ ne.
	B_GiveInvItems (self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output (self, other, "DIA_Maria_Belohnung_Gold_17_01"); //Tak si na opl·tku vezmi tohle zlato. Zaslouûil sis to.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //Ano.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //Dobr·, pokud tady pracujeö, tak dohlÈdnu na to, abys dost·val sluön˝ ûold.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //Vraù se, aû si s m˝m manûelem promluvÌö o tvÈm platu.
	Info_ClearChoices (DIA_Maria_Belohnung);
};
		
// ************************************************************
// 							AboutOnar
// ************************************************************
instance DIA_Maria_AboutOnar	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 7;
	condition	= DIA_Maria_AboutOnar_Condition;
	information	= DIA_Maria_AboutOnar_Info;
	permanent  	= FALSE;
	description = "PovÏz mi nÏco o Onarovi.";
};

func int DIA_Maria_AboutOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info ()
{
	AI_Output (other, self, "DIA_Maria_AboutOnar_15_00"); //ÿekni mi nÏco o Onarovi.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_01"); //Je to fajn chlap. Trochu nabruËen˝ a hodnÏ netrpÏliv˝, ale vöichni m·me svÈ chyby.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_02"); //ÿekla jsem svÈmu muûi, proË ty voj·ky nech·, aby s nÌm takhle zach·zeli.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_03"); //DÏlej nÏco, ¯Ìk·m.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_04"); //Tak najal ûoldnÈ¯e. TeÔ se cÌtÌm jako uprost¯ed v·lky.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_05"); //Ale my vlastnÏ jsme ve v·lce, nebo ne?
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Maria_PERM	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 8;
	condition	= DIA_Maria_PERM_Condition;
	information	= DIA_Maria_PERM_Info;
	permanent  	= FALSE;
	description = "Stalo se poslednÌ dobou nÏco zajÌmavÈho?";
};

func int DIA_Maria_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info ()
{
	AI_Output (other, self, "DIA_Maria_PERM_15_00"); //Stalo se poslednÌ dobou nÏco zajÌmavÈho?
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_01"); //Proöli tudy paladinovÈ.
		AI_Output (self, other, "DIA_Maria_PERM_17_02"); //Nejd¯Ìv jsme si mysleli, ûe p¯iöli napadnout farmu, ale ve skuteËnosti mÏli namÌ¯eno do HornickÈho ˙dolÌ.
	}
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_03"); //Wasili naËapal p¯ed p·r dny v noci zlodÏje. Jinak je tady klid.
	};
	
	if (Kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_04"); //Je to tu mnohem klidnÏjöÌ, co nÏkte¯Ì ze ûoldnÈ¯˘ odeöli.
	};
};
			

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maria_PICKPOCKET (C_INFO)
{
	npc			= BAU_910_Maria;
	nr			= 900;
	condition	= DIA_Maria_PICKPOCKET_Condition;
	information	= DIA_Maria_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Maria_PICKPOCKET_Condition()
{
	C_Beklauen (60, 110);
};
 
FUNC VOID DIA_Maria_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maria_PICKPOCKET);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_BACK 		,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};
	
func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};


			
			
			
			



	















