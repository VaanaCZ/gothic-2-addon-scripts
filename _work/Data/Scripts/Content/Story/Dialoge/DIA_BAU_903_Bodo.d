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
	description = "Co słychać?";
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
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //Strażnicy zbyt długo nami pomiatali. Ale teraz nie ośmielą się tu pokazać, skoro najemnicy są po naszej stronie.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //Król może sądzi, że wszystko ujdzie mu płazem. Ale my nie zamierzamy tego dłużej znosić.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //W porządku. Jak zobaczysz jakichś strażników, to huknij ich raz ode mnie, dobra?
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //Dobrze. Niech Innos będzie z tobą.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //Żołnierze Króla nie są mile widziani na farmie.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //Wiele osób i tak będzie z tobą gadało, ale na pewno nie zdobędziesz tu popularności.
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
	description = "W mieście mówią, że chłopi się buntują!";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //W mieście mówią, że chłopi się buntują!
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //Bzdury. Po prostu bronimy tego, na co ciężko pracowaliśmy.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //To jasne, że ciężar wojny spoczywa na grzbietach wieśniaków. Ale Onar nie będzie się już bezczynnie przyglądał, jak Król zdziera z nas skórę.
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
	description = "Mogę gdzieś tu odpocząć?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //Mogę gdzieś tu odpocząć?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //Jeśli chcesz się gdzieś przespać, idź do stodoły. Tylko nie połóż się przez pomyłkę w łóżku jakiegoś najemnika.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //Onar dba o to, żeby zostawili w spokoju wieśniaków, ale z obcym spoza farmy mogą zrobić, co im się spodoba.
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
	description = "Cipher powiedział, że ktoś mu ukradł paczkę bagiennego ziela...";
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
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //Cipher powiedział, że ktoś mu ukradł paczkę bagiennego ziela...
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //I co?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //Myśli, że ty to zrobiłeś.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //Och, więc DLATEGO się tak na mnie tępo gapi.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //Ostatnio byłem dla niego bardzo uprzejmy, bo myślałem, że jest mu ciężko.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //Ale nic to nie dało. Ja byłem dla niego uprzejmy, a on się gapił, jakby chciał mnie zabić.
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
	description = "Dawaj mi to ziele, albo pożałujesz!";
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
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //Dawaj mi to ziele, albo pożałujesz!
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //Słuchaj, mam tylko jednego skręta. Weź go i zostaw mnie w spokoju.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //Wiesz, że najemnicy Onara nas chronią, co?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //Więc nie rób nic głupiego!
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
	description = "Nie wierzę w ani jedno twoje słowo! Dawaj bagienne ziele!";
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
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //Nie wierzę w ani jedno twoje słowo! Dawaj bagienne ziele!
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //Nie mam go. Mówię prawdę.
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













