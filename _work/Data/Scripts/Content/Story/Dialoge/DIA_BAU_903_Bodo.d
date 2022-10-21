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
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //Domobrana n·s vydÌrala dost dlouho. TeÔ, kdyû jsou ûoldnÈ¯i na naöÌ stranÏ, se tu uû nedovolÌ vÌckr·t objevit.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //Kr·l si myslÌ, ûe n·m m˘ûe vöechno sebrat a odjet. Ale my uû mu nic ned·me.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //Fajn. Kdyû uvidÌö nÏkoho z domobrany, nandej mu to i za mÏ, jo?
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //Dobr·. Innos s tebou.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //Kr·lovi voj·ci nejsou na tÈhle farmÏ vÌt·ni.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //I tak s tebou tady moûn· bude mluvit dost lidÌ, ale urËitÏ si tu neudÏl·ö p¯·tele.
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
	description = "Ve mÏstÏ se mluvÌ o rolnickÈ vzpou¯e!";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //Ve mÏstÏ se mluvÌ o rolnickÈ vzpou¯e!
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //To je nesmysl. Jenom se snaûÌme br·nit v˝sledky naöÌ tvrdÈ d¯iny.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //V·lka vûdycky nejvÌc dolÈh· na bedra rolnÌk˘. A Onar uû nehodl· jen d·l st·t a koukat, jak n·s ty kr·lovskÈ pijavice vys·vajÌ.
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
	description = "M˘ûu si tady nÏkde odpoËinout?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //M˘ûu si tady nÏkde odpoËinout?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //Jestli hled·ö mÌsto na spanÌ, zajdi si do stodoly. Ale ani omylem si nelehni na ûold·ckou postel.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //Onar zajistil, aby nechali n·s farm·¯e na pokoji. Ale s cizinci, co nepat¯Ì na farmu, si ûold·ci mohou dÏlat, co se jim zlÌbÌ.
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
	description = "Cipher mi ¯ekl, ûe mu nÏkdo ukradl balÌk tr·vy z baûin...";
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
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //Cipher mi ¯ekl, ûe mu nÏkdo ukradl balÌk tr·vy z baûin.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //A?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //MyslÌ si, ûes to byl ty, kdo mu to vzal.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //Aha, tak proto na mÏ ten chlap vûdycky tak p¯iblble zÌr·.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //PoslednÌ dobou jsem na nÏj byl obzvl·öù mil˝, protoûe vypadal, ûe slÌznul po¯·dnou pecku.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //Ale s tÌm j· nic neudÏl·m. M˘ûu se k nÏmu chovat p¯·telsky, jak chci, a on se na mÏ stejnÏ öklebÌ, jako by mÏ chtÏl zabÌt.
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
	description = "Dej mi mÌsto toho tu tr·vu!";
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
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //Dej mi mÌsto toho tu tr·vu!
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //Hele, vöechno, co m·m, je tenhle öpek. Vem si ho a nech mÏ na pokoji.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //Je ti jasn˝, ûe na n·s ûold·ci dohlÌûej, ûe jo?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //Tak û·dn˝ hlouposti!
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
	description = "NevÏ¯Ìm ti ani slovo. Dej mi tu tr·vu!";
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
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //NevÏ¯Ìm ti ani slovo. Dej mi tu tr·vu!
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //Nem·m ji. Namouduöi.
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













