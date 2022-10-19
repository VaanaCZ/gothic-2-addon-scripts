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
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //Domobrana n�s vyd�rala dost dlouho. Te�, kdy� jsou �oldn��i na na�� stran�, se tu u� nedovol� v�ckr�t objevit.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //Kr�l si mysl�, �e n�m m��e v�echno sebrat a odjet. Ale my u� mu nic ned�me.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //Fajn. Kdy� uvid� n�koho z domobrany, nandej mu to i za m�, jo?
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //Dobr�. Innos s tebou.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //Kr�lovi voj�ci nejsou na t�hle farm� v�t�ni.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //I tak s tebou tady mo�n� bude mluvit dost lid�, ale ur�it� si tu neud�l� p��tele.
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
	description = "Ve m�st� se mluv� o rolnick� vzpou�e!";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //Ve m�st� se mluv� o rolnick� vzpou�e!
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //To je nesmysl. Jenom se sna��me br�nit v�sledky na�� tvrd� d�iny.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //V�lka v�dycky nejv�c dol�h� na bedra roln�k�. A Onar u� nehodl� jen d�l st�t a koukat, jak n�s ty kr�lovsk� pijavice vys�vaj�.
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
	description = "M��u si tady n�kde odpo�inout?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //M��u si tady n�kde odpo�inout?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //Jestli hled� m�sto na span�, zajdi si do stodoly. Ale ani omylem si nelehni na �old�ckou postel.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //Onar zajistil, aby nechali n�s farm��e na pokoji. Ale s cizinci, co nepat�� na farmu, si �old�ci mohou d�lat, co se jim zl�b�.
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
	description = "Cipher mi �ekl, �e mu n�kdo ukradl bal�k tr�vy z ba�in...";
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
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //Cipher mi �ekl, �e mu n�kdo ukradl bal�k tr�vy z ba�in.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //A?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //Mysl� si, �es to byl ty, kdo mu to vzal.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //Aha, tak proto na m� ten chlap v�dycky tak p�iblble z�r�.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //Posledn� dobou jsem na n�j byl obzvl᚝ mil�, proto�e vypadal, �e sl�znul po��dnou pecku.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //Ale s t�m j� nic neud�l�m. M��u se k n�mu chovat p��telsky, jak chci, a on se na m� stejn� �kleb�, jako by m� cht�l zab�t.
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
	description = "Dej mi m�sto toho tu tr�vu!";
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
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //Dej mi m�sto toho tu tr�vu!
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //Hele, v�echno, co m�m, je tenhle �pek. Vem si ho a nech m� na pokoji.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //Je ti jasn�, �e na n�s �old�ci dohl�ej, �e jo?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //Tak ��dn� hlouposti!
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
	description = "Nev���m ti ani slovo. Dej mi tu tr�vu!";
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
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //Nev���m ti ani slovo. Dej mi tu tr�vu!
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //Nem�m ji. Namoudu�i.
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













