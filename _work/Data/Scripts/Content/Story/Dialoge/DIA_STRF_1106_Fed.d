///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fed_EXIT   (C_INFO)
{
	npc         = STRF_1106_Fed;
	nr          = 999;
	condition   = DIA_Fed_EXIT_Condition;
	information = DIA_Fed_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fed_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fed_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_HALLO		(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  2;
	condition	 = 	DIA_Fed_HALLO_Condition;
	information	 = 	DIA_Fed_HALLO_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};

func int DIA_Fed_HALLO_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Fed_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Fed_HALLO_08_00"); //Czego ode mnie chcesz? Nigdzie nie id�!
	AI_Output (other, self, "DIA_Fed_HALLO_15_01"); //Spokojnie, odpr� si� - nikt nie wymaga od ciebie, �eby� si� st�d rusza�.
	AI_Output (self, other, "DIA_Fed_HALLO_08_02"); //Chwa�a Innosowi. Wiesz, przez ostatnie kilka dni wielu naszych ludzi opu�ci�o ob�z i �aden z nich nie wr�ci�.
	AI_Output (self, other, "DIA_Fed_HALLO_08_03"); //Wszyscy zostali po�arci przez z�bacze. Ale nie ja. Ja zostan� tutaj, dop�ki to wszystko si� nie sko�czy.
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Snapper	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  3;
	condition	 = 	DIA_Fed_Snapper_Condition;
	information	 = 	DIA_Fed_Snapper_Info;
	permanent	 =  FALSE;
	description	 = 	"Co wiesz o z�baczach?";
};
func int DIA_Fed_Snapper_Condition ()
{	
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fed_Snapper_Info ()
{
	AI_Output (other, self, "DIA_Fed_Snapper_15_00"); //Co wiesz o z�baczach?
	AI_Output (self, other, "DIA_Fed_Snapper_08_01"); //Bilgot obserwuje je przez ca�� noc. Kilka z nich jest na dole, w stawie obok mrocznej wie�y.
	AI_Output (self, other, "DIA_Fed_Snapper_08_02"); //Inne czaj� si� na g�rze... Czekaj�, a� b�dziemy wyczerpani. Wtedy staniemy si� �atwym �upem...
	AI_Output (self, other, "DIA_Fed_Snapper_08_03"); //Znale�li�my si� w pu�apce. Wkr�tce zaatakuj� ob�z i po�r� nas wszystkich...
	AI_Output (other, self, "DIA_Fed_Snapper_15_04"); //Rozumiem.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Perm	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  5;
	condition	 = 	DIA_Fed_Perm_Condition;
	information	 = 	DIA_Fed_Perm_Info;
	permanent	 =  TRUE;
	description	 = 	"Wszystko w porz�dku?";
};
func int DIA_Fed_Perm_Condition ()
{	
		return TRUE;
};
func void DIA_Fed_Perm_Info ()
{
	AI_Output (other, self, "DIA_Fed_Perm_15_00"); //Wszystko w porz�dku?
	
	if (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_01"); //Wsz�dzie dooko�a czaj� si� z�bacze. Potrafisz je wyczu�? Ja potrafi�... Czuj� ich smr�d...
	}
	else 
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_02"); //Z�bacze chyba si� wycofa�y. Ale to nic nie oznacza. Jeszcze tu wr�c� - a je�li nie one, to wilki, jaszczury albo orkowie.
		AI_Output (self, other, "DIA_Fed_Perm_08_03"); //Pr�dzej czy p�niej nas dostan�, zabij� i po�r� nasze zw�oki...
	};
	AI_StopProcessInfos(self);
	

};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fed_PICKPOCKET (C_INFO)
{
	npc			= STRF_1106_Fed;
	nr			= 900;
	condition	= DIA_Fed_PICKPOCKET_Condition;
	information	= DIA_Fed_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fed_PICKPOCKET_Condition()
{
	C_Beklauen (32, 8);
};
 
FUNC VOID DIA_Fed_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fed_PICKPOCKET);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_BACK 		,DIA_Fed_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fed_PICKPOCKET_DoIt);
};

func void DIA_Fed_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};
	
func void DIA_Fed_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};




















