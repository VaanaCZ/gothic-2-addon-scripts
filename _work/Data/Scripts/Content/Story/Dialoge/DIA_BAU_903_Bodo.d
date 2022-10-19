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
	description = "Co s³ychaæ?";
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
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //Stra¿nicy zbyt d³ugo nami pomiatali. Ale teraz nie oœmiel¹ siê tu pokazaæ, skoro najemnicy s¹ po naszej stronie.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //Król mo¿e s¹dzi, ¿e wszystko ujdzie mu p³azem. Ale my nie zamierzamy tego d³u¿ej znosiæ.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //W porz¹dku. Jak zobaczysz jakichœ stra¿ników, to huknij ich raz ode mnie, dobra?
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //Dobrze. Niech Innos bêdzie z tob¹.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //¯o³nierze Króla nie s¹ mile widziani na farmie.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //Wiele osób i tak bêdzie z tob¹ gada³o, ale na pewno nie zdobêdziesz tu popularnoœci.
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
	description = "W mieœcie mówi¹, ¿e ch³opi siê buntuj¹!";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //W mieœcie mówi¹, ¿e ch³opi siê buntuj¹!
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //Bzdury. Po prostu bronimy tego, na co ciê¿ko pracowaliœmy.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //To jasne, ¿e ciê¿ar wojny spoczywa na grzbietach wieœniaków. Ale Onar nie bêdzie siê ju¿ bezczynnie przygl¹da³, jak Król zdziera z nas skórê.
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
	description = "Mogê gdzieœ tu odpocz¹æ?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //Mogê gdzieœ tu odpocz¹æ?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //Jeœli chcesz siê gdzieœ przespaæ, idŸ do stodo³y. Tylko nie po³ó¿ siê przez pomy³kê w ³ó¿ku jakiegoœ najemnika.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //Onar dba o to, ¿eby zostawili w spokoju wieœniaków, ale z obcym spoza farmy mog¹ zrobiæ, co im siê spodoba.
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
	description = "Cipher powiedzia³, ¿e ktoœ mu ukrad³ paczkê bagiennego ziela...";
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
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //Cipher powiedzia³, ¿e ktoœ mu ukrad³ paczkê bagiennego ziela...
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //I co?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //Myœli, ¿e ty to zrobi³eœ.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //Och, wiêc DLATEGO siê tak na mnie têpo gapi.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //Ostatnio by³em dla niego bardzo uprzejmy, bo myœla³em, ¿e jest mu ciê¿ko.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //Ale nic to nie da³o. Ja by³em dla niego uprzejmy, a on siê gapi³, jakby chcia³ mnie zabiæ.
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
	description = "Dawaj mi to ziele, albo po¿a³ujesz!";
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
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //Dawaj mi to ziele, albo po¿a³ujesz!
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //S³uchaj, mam tylko jednego skrêta. WeŸ go i zostaw mnie w spokoju.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //Wiesz, ¿e najemnicy Onara nas chroni¹, co?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //Wiêc nie rób nic g³upiego!
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
	description = "Nie wierzê w ani jedno twoje s³owo! Dawaj bagienne ziele!";
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
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //Nie wierzê w ani jedno twoje s³owo! Dawaj bagienne ziele!
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //Nie mam go. Mówiê prawdê.
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













