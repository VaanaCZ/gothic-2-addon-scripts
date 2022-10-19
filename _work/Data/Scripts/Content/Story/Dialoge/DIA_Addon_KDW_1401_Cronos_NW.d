///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Cronos_EXIT   (C_INFO)
{
	npc         = KDW_1401_Addon_Cronos_NW;
	nr          = 999;
	condition   = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Hallo		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Hallo_Condition;
	information	 = 	DIA_Addon_Cronos_Hallo_Info;

	description	 = 	"Mohl bych t� na chvilku vyru�it?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //M��u t� na chvilku vyru�it?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //(p�ekvapen�) To jsi TY? Nikdy jsem nemyslel, �e ten tv�j ksicht je�t� n�kdy uvid�m.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //M� v�n� kur�, �e se tu ukazuje�. Sv�ho �asu bychom t� za�iva st�hli z k��e.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //M��e� b�t r�d, �e u� je to p�r t�dn� a v�ichni jsme se uklidnili.
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WasMachstdu		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_WasMachstdu_Condition;
	information	 = 	DIA_Addon_Cronos_WasMachstdu_Info;

	description	 = 	"Co tady d�l�?";
};

func int DIA_Addon_Cronos_WasMachstdu_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_WasMachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //Co tady d�l�?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //(zmaten�) M�m zjistit n�co v�c o str�c�ch chr�mu.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Jsou p�kn� tuh� o��ek, to ti pov�m. Nic podobn�ho, jako jsou tihle kamenn� str�ci, jsem je�t� nevid�l.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //Jednu chv�li �pln� bezdu�e stoj�, a najednou t� napadnou, jako kdy� je n�co posedne.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Je�t� jsem nezjistil, co je vlastn� poh�n�, ale jedna v�c je jist�: jsou magick�ho p�vodu.
};
///////////////////////////////////////////////////////////////////////
//	Info Waechter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Waechter		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Waechter_Condition;
	information	 = 	DIA_Addon_Cronos_Waechter_Info;

	description	 = 	"Pov�z mi n�co o t�ch kamenn�ch str�c�ch.";
};

func int DIA_Addon_Cronos_Waechter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_Waechter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Pov�z mi o t�ch kamenn�ch str�c�ch n�co v�c.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //(nejist�) Zat�m ti v�c ne�eknu. Museli jsme je v�echny zni�it. Te� u� nejsou nebezpe�n�.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Kdy� jsme sem p�i�li, napadli n�s.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Porazili jsme je jen spojen�mi silami a ob�v�m se, �e za port�lem jich �ek� je�t� v�c.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Mus� existovat zp�sob, jak zni�it s�lu, kter� je poh�n�, a ud�lat z nich zase oby�ejn� sochy.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_NW_Trade		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_NW_Trade_Condition;
	information	 = 	DIA_Addon_Cronos_NW_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"M��e� mi prodat n�jak� vybaven�?";
};

func int DIA_Addon_Cronos_NW_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //M��e� mi prodat n�jakou v�bavu?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Pro� ne? Pokud si dob�e vzpom�n�m, u� jsme spolu obchodovali.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Pov�z mi, co pot�ebuje�.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
