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
	description = "Co s�ycha�?";
};
FUNC INT DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Hallo_Info()
{
	AI_Output (other, self, "DIA_Bodo_Hallo_15_00"); //Jak leci?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //Stra�nicy zbyt d�ugo nami pomiatali. Ale teraz nie o�miel� si� tu pokaza�, skoro najemnicy s� po naszej stronie.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //Kr�l mo�e s�dzi, �e wszystko ujdzie mu p�azem. Ale my nie zamierzamy tego d�u�ej znosi�.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //W porz�dku. Jak zobaczysz jakich� stra�nik�w, to huknij ich raz ode mnie, dobra?
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //Dobrze. Niech Innos b�dzie z tob�.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //�o�nierze Kr�la nie s� mile widziani na farmie.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //Wiele os�b i tak b�dzie z tob� gada�o, ale na pewno nie zdob�dziesz tu popularno�ci.
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
	description = "W mie�cie m�wi�, �e ch�opi si� buntuj�!";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //W mie�cie m�wi�, �e ch�opi si� buntuj�!
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //Bzdury. Po prostu bronimy tego, na co ci�ko pracowali�my.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //To jasne, �e ci�ar wojny spoczywa na grzbietach wie�niak�w. Ale Onar nie b�dzie si� ju� bezczynnie przygl�da�, jak Kr�l zdziera z nas sk�r�.
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
	description = "Mog� gdzie� tu odpocz��?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //Mog� gdzie� tu odpocz��?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //Je�li chcesz si� gdzie� przespa�, id� do stodo�y. Tylko nie po�� si� przez pomy�k� w ��ku jakiego� najemnika.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //Onar dba o to, �eby zostawili w spokoju wie�niak�w, ale z obcym spoza farmy mog� zrobi�, co im si� spodoba.
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
	description = "Cipher powiedzia�, �e kto� mu ukrad� paczk� bagiennego ziela...";
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
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //Cipher powiedzia�, �e kto� mu ukrad� paczk� bagiennego ziela...
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //I co?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //My�li, �e ty to zrobi�e�.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //Och, wi�c DLATEGO si� tak na mnie t�po gapi.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //Ostatnio by�em dla niego bardzo uprzejmy, bo my�la�em, �e jest mu ci�ko.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //Ale nic to nie da�o. Ja by�em dla niego uprzejmy, a on si� gapi�, jakby chcia� mnie zabi�.
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
	description = "Dawaj mi to ziele, albo po�a�ujesz!";
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
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //Dawaj mi to ziele, albo po�a�ujesz!
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //S�uchaj, mam tylko jednego skr�ta. We� go i zostaw mnie w spokoju.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //Wiesz, �e najemnicy Onara nas chroni�, co?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //Wi�c nie r�b nic g�upiego!
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
	description = "Nie wierz� w ani jedno twoje s�owo! Dawaj bagienne ziele!";
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
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //Nie wierz� w ani jedno twoje s�owo! Dawaj bagienne ziele!
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //Nie mam go. M�wi� prawd�.
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













