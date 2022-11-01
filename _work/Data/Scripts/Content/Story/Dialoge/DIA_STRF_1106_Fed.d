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
	AI_Output (self, other, "DIA_Fed_HALLO_08_00"); //Czego ode mnie chcesz? Nigdzie nie idę!
	AI_Output (other, self, "DIA_Fed_HALLO_15_01"); //Spokojnie, odpręż się - nikt nie wymaga od ciebie, żebyś się stąd ruszał.
	AI_Output (self, other, "DIA_Fed_HALLO_08_02"); //Chwała Innosowi. Wiesz, przez ostatnie kilka dni wielu naszych ludzi opuściło obóz i żaden z nich nie wrócił.
	AI_Output (self, other, "DIA_Fed_HALLO_08_03"); //Wszyscy zostali pożarci przez zębacze. Ale nie ja. Ja zostanę tutaj, dopóki to wszystko się nie skończy.
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
	description	 = 	"Co wiesz o zębaczach?";
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
	AI_Output (other, self, "DIA_Fed_Snapper_15_00"); //Co wiesz o zębaczach?
	AI_Output (self, other, "DIA_Fed_Snapper_08_01"); //Bilgot obserwuje je przez całą noc. Kilka z nich jest na dole, w stawie obok mrocznej wieży.
	AI_Output (self, other, "DIA_Fed_Snapper_08_02"); //Inne czają się na górze... Czekają, aż będziemy wyczerpani. Wtedy staniemy się łatwym łupem...
	AI_Output (self, other, "DIA_Fed_Snapper_08_03"); //Znaleźliśmy się w pułapce. Wkrótce zaatakują obóz i pożrą nas wszystkich...
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
	description	 = 	"Wszystko w porządku?";
};
func int DIA_Fed_Perm_Condition ()
{	
		return TRUE;
};
func void DIA_Fed_Perm_Info ()
{
	AI_Output (other, self, "DIA_Fed_Perm_15_00"); //Wszystko w porządku?
	
	if (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_01"); //Wszędzie dookoła czają się zębacze. Potrafisz je wyczuć? Ja potrafię... Czuję ich smród...
	}
	else 
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_02"); //Zębacze chyba się wycofały. Ale to nic nie oznacza. Jeszcze tu wrócą - a jeśli nie one, to wilki, jaszczury albo orkowie.
		AI_Output (self, other, "DIA_Fed_Perm_08_03"); //Prędzej czy później nas dostaną, zabiją i pożrą nasze zwłoki...
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




















