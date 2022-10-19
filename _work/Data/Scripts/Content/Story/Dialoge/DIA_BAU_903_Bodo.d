// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bodo_EXIT   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 999;
	condition   = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo (PERM) 
// ************************************************************
INSTANCE DIA_Bodo_Hallo   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 1;
	condition   = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hallo_Info;
	permanent   = TRUE;
	description = "Jak se vede?";
};
FUNC INT DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Hallo_Info()
{
	AI_Output (other, self, "DIA_Bodo_Hallo_15_00"); //Jak se vede?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //Domobrana nás vydírala dost dlouho. Teë, když jsou žoldnéâi na naší stranê, se tu už nedovolí víckrát objevit.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //Král si myslí, že nám mùže všechno sebrat a odjet. Ale my už mu nic nedáme.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //Fajn. Když uvidíš nêkoho z domobrany, nandej mu to i za mê, jo?
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //Dobrá. Innos s tebou.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //Královi vojáci nejsou na téhle farmê vítáni.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //I tak s tebou tady možná bude mluvit dost lidí, ale urèitê si tu neudêláš pâátele.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Bodo_Bauernaufstand   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 2;
	condition   = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent   = FALSE;
	description = "Ve mêstê se mluví o rolnické vzpouâe!";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //Ve mêstê se mluví o rolnické vzpouâe!
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //To je nesmysl. Jenom se snažíme bránit výsledky naší tvrdé dâiny.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //Válka vždycky nejvíc doléhá na bedra rolníkù. A Onar už nehodlá jen dál stát a koukat, jak nás ty královské pijavice vysávají.
};

// ************************************************************
// 			  				   Bett
// ************************************************************
INSTANCE DIA_Bodo_Bett   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 3;
	condition   = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent   = FALSE;
	description = "Mùžu si tady nêkde odpoèinout?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //Mùžu si tady nêkde odpoèinout?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //Jestli hledáš místo na spaní, zajdi si do stodoly. Ale ani omylem si nelehni na žoldáckou postel.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //Onar zajistil, aby nechali nás farmáâe na pokoji. Ale s cizinci, co nepatâí na farmu, si žoldáci mohou dêlat, co se jim zlíbí.
};

// ************************************************************
// 			  				   Cipher
// ************************************************************
INSTANCE DIA_Bodo_Cipher   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 4;
	condition   = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent   = FALSE;
	description = "Cipher mi âekl, že mu nêkdo ukradl balík trávy z bažin...";
};
FUNC INT DIA_Bodo_Cipher_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	|| (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_Cipher_Info()
{
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //Cipher mi âekl, že mu nêkdo ukradl balík trávy z bažin.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //A?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //Myslí si, žes to byl ty, kdo mu to vzal.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //Aha, tak proto na mê ten chlap vždycky tak pâiblble zírá.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //Poslední dobou jsem na nêj byl obzvlášã milý, protože vypadal, že slíznul poâádnou pecku.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //Ale s tím já nic neudêlám. Mùžu se k nêmu chovat pâátelsky, jak chci, a on se na mê stejnê šklebí, jako by mê chtêl zabít.
};

// ************************************************************
// 			  				  WeedOrElse
// ************************************************************
INSTANCE DIA_Bodo_WeedOrElse   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 5;
	condition   = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent   = FALSE;
	description = "Dej mi místo toho tu trávu!";
};
FUNC INT DIA_Bodo_WeedOrElse_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_Cipher))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedOrElse_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //Dej mi místo toho tu trávu!
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //Hele, všechno, co mám, je tenhle špek. Vem si ho a nech mê na pokoji.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //Je ti jasný, že na nás žoldáci dohlížej, že jo?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //Tak žádný hlouposti!
	};
};

// ************************************************************
// 			  				  WeedPERM
// ************************************************************
INSTANCE DIA_Bodo_WeedPERM   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 6;
	condition   = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent   = TRUE;
	description = "Nevêâím ti ani slovo. Dej mi tu trávu!";
};
FUNC INT DIA_Bodo_WeedPERM_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_WeedOrElse))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedPERM_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //Nevêâím ti ani slovo. Dej mi tu trávu!
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //Nemám ji. Namouduši.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bodo_PICKPOCKET (C_INFO)
{
	npc			= BAU_903_Bodo;
	nr			= 900;
	condition	= DIA_Bodo_PICKPOCKET_Condition;
	information	= DIA_Bodo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bodo_PICKPOCKET_Condition()
{
	C_Beklauen (30, 60);
};
 
FUNC VOID DIA_Bodo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bodo_PICKPOCKET);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_BACK 		,DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};
	
func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};













