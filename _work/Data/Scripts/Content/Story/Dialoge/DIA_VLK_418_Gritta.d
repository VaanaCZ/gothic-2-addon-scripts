// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_EXIT_Condition;
	information	= DIA_Gritta_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Gritta_PICKPOCKET (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 900;
	condition	= DIA_Gritta_PICKPOCKET_Condition;
	information	= DIA_Gritta_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Gritta_PICKPOCKET_Condition()
{
	C_Beklauen (20, 20);
};
 
FUNC VOID DIA_Gritta_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gritta_PICKPOCKET);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_BACK 		,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
	
func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Gritta_Hello(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 10;
	condition	= DIA_Gritta_Hello_Condition;
	information	= DIA_Gritta_Hello_Info;
	permanent	= FALSE;
	Important   = TRUE;
};                       
FUNC INT DIA_Gritta_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Gritta_Hello_16_00"); //Czego tutaj chcesz? Je�li przyszed�e� na �ebry, to musz� ci� rozczarowa�. Jestem biedn� wdow�.
	AI_Output (self ,other,"DIA_Gritta_Hello_16_01"); //Nazywam si� Gritta. Od kiedy umar� m�j m��, prowadz� gospodarstwo mojego wuja, Thorbena.
};
//*************************************************************
//			Matteo will sein Geld
//*************************************************************
INSTANCE DIA_Gritta_WantsMoney(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 2;
	condition	= DIA_Gritta_WantsMoney_Condition;
	information	= DIA_Gritta_WantsMoney_Info;
	permanent	= FALSE;
	description = "Przysy�a mnie Matteo. Wci�� jeste� mu winna z�oto.";
};                       
FUNC INT DIA_Gritta_WantsMoney_Condition()
{
	if (MIS_Matteo_Gold == LOG_RUNNING)
	{
		return TRUE;
	};	
};
//------------------------------------
var int Gritta_WantPay;
var int Gritta_Threatened;
//------------------------------------
FUNC VOID DIA_Gritta_WantsMoney_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_15_00"); //Przysy�a mnie Matteo. Wci�� jeste� mu winna z�oto.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_01"); //Chce dosta� pieni�dze? Niby za co? Dostarczone ubrania by�y wadliwe, wykonane z kiepskich materia��w i �le skrojone.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_02"); //A widzia�e� te kolory? To nie jest towar, kt�ry zam�wi�am. To jest zwyczajne wy�udzenie!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_03"); //Kiedy jeszcze m�j m�� chodzi� po tym �wiecie, ta gnida nigdy by si� na to nie odwa�y�a. Och, m�j biedny m��...

	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Do�� tego. Gdzie z�oto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue01 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue01_16_00"); //By� takim dobrym cz�owiekiem. Przystojny, pracowity, sympatyczny. Mieli�my wszystko - pieni�dze, szcz�cie...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_01"); //Czasami dostawali�my nawet zaproszenia na przer�ne imprezy organizowane przez arystokracj�. Ach, te wszystkie pi�kne ubrania, te fryzury...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_02"); //Te wykwintne potrawy i kulturalne rozmowy. Kiedy� wszystko by�o lepsze. Nikt nie odwa�y�by si� poni�a� biednej wdowy tak idiotycznymi roszczeniami.
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Do�� tego. Gdzie z�oto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue02);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue02 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue02_16_00"); //Co mam teraz zrobi�? Moje zarobki pokrywaj� jedynie najbardziej podstawowe potrzeby, a i to z ledwo�ci�. Na ulicach widzi si� coraz wi�cej biedy...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_01"); //Ludzie musz� sobie wszystkiego odmawia�. Od tygodni nie przyp�yn�� tu �aden statek. M�j m�� by� kapitanem statku handlowego - a raczej jego w�a�cicielem...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_02"); //Z dalekich podr�y zawsze przywozi� mi jakie� prezenty - kosztowne tkaniny z kontynentu, drogie przyprawy z po�udniowych krain...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Do�� tego. Gdzie z�oto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue03);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue03 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue03_16_00"); //Wi�kszo�� ludzi nawet nie s�ysza�a o takich rzeczach. Jednak pewnego dnia dosta�am wiadomo��, �e Gritta zaton�a. Tak si� nazywa� statek mojego m�a. Nazwa� go moim imieniem...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue03_16_01"); //...z mi�o�ci do mnie. P�aka�am i modli�am si�, aby m�j m�� prze�y� t� katastrof�, ka�dego dnia wygl�da�am jego powrotu, albo chocia� jakiej� wiadomo�ci, ale na pr�no...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_02"); //Niech Innos zlituje si� nad jego dusz�. Niech spoczywa w pokoju. Od czasu jego �mierci mam tylko same problemy, a teraz jeszcze ten bezduszny, chciwy Matteo...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_03"); //...chce odebra� mi resztki moich oszcz�dno�ci. Prosz�, zlituj si� nad nieszcz�sn� kobiet�. Gdyby m�j m�� nadal �y�, ta gnida nigdy by si� na to nie odwa�y�a... Och, m�j biedny m��...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Do�� tego. Gdzie z�oto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_WhereMoney ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_WhereMoney_15_00"); //Do�� tego. Gdzie z�oto?
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01"); //Ale ja nie mam �adnych pieni�dzy, jestem tylko biedn� wdow�!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Dawaj kas� albo oberwiesz...",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Wygl�da wi�c na to, �e b�dziemy musieli sprzeda� twoje graty...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Zap�ac� za ciebie.",DIA_Gritta_WantsMoney_IWillPay);
};
FUNC VOID DIA_Gritta_WantsMoney_EnoughStuff ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //Sprzedamy po prostu kilka twoich ubra�. Jestem pewien, �e masz jeszcze jakie� drogie suknie w swojej garderobie...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //Jak �miesz, troglodyto! Dobrze, we� to z�oto.
	B_GiveInvItems (self,other,ItMi_Gold, 100); 
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //Widzisz, to nie by�o takie trudne.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //A teraz wyno� si� z mojego domu.
	
	Gritta_GoldGiven = TRUE;
	
	AI_StopProcessInfos (self); 
};
func VOID DIA_Gritta_WantsMoney_IWillPay ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_00"); //Zap�ac� za ciebie.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_01"); //Zrobi�by� to? Och, wiedzia�am, �e nie jeste� takim chciwym draniem jak Matteo!
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_02"); //Tak, tak, to drobiazg.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_03"); //Wr�� tutaj, kiedy ju� to za�atwisz. Chcia�abym ci okaza� swoj� wdzi�czno��.
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	
	Gritta_WantPay = TRUE;
};
FUNC VOID DIA_Gritta_WantsMoney_BeatUp ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_BeatUp_15_00"); //Dawaj kas� albo oberwiesz...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_BeatUp_16_01"); //Jeste� zwyk�ym oprychem. No dalej, si�gnij po bro�, a wezw� stra�!
	
	Gritta_Threatened = TRUE;
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WINE
///////////////////////////////////////////////////////////////////////
instance DIA_Gritta_WINE		(C_INFO)
{
	npc			 = 	VLK_418_Gritta;
	nr			 = 	2;
	condition	 = 	DIA_Gritta_WINE_Condition;
	information	 = 	DIA_Gritta_WINE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Gritta_WINE_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Gritta_WantPay == TRUE)
	&& (MIS_Matteo_Gold == LOG_SUCCESS)
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		return TRUE;
	};
};
func void DIA_Gritta_WINE_Info ()
{
	AI_Output (self, other, "DIA_Gritta_WINE_16_00"); //To by�o bardzo szlachetne, �e zgodzi�e� si� za mnie zap�aci�. Chcia�abym okaza� ci moj� wdzi�czno��.
	AI_Output (self, other, "DIA_Gritta_WINE_16_01"); //Oto butelka wina, kt�r� m�j m��, niechaj Innos przyjmie do siebie jego dusz�, przywi�z� z po�udniowych wysp.
	AI_Output (self, other, "DIA_Gritta_WINE_16_02"); //Opowiem o tym, co dla mnie zrobi�e�, wszystkim moim znajomym. Jest jeszcze na tym �wiecie kto�, kto wie co to honor, i kto...
	AI_Output (other, self, "DIA_Gritta_WINE_15_03"); //Tak, oczywi�cie, to drobiazg.

	B_GivePlayerXP 		(XP_PayForGritta);
	B_GiveInvItems 		(self, other, Itfo_Wine, 1);
	
	AI_StopProcessInfos (self); 
};
// *************************************************************
//							PERM (1u2)
// *************************************************************
instance DIA_Gritta_PERM (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr		 	= 3;
	condition	= DIA_Gritta_PERM_Condition;
	information	= DIA_Gritta_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Gritta_PERM_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Npc_KnowsInfo (other, DIA_Gritta_WantsMoney))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Gritta_PERM_Info ()
{
	if (Npc_KnowsInfo (other, DIA_Gritta_WINE))
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_00"); //Dop�ki w tym mie�cie s� tacy jak ty, wierz�, �e przyjd� jeszcze lepsze czasy.
	}
	else if (Gritta_WantPay == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_01"); //Wr��, kiedy ju� za�atwisz spraw� z tym niegodziwcem.
	}
	else if (Gritta_Threatened == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_02"); //Czemu tak stoisz jak kompletny idiota? I tak nie odwa�ysz si� mnie zaatakowa�!
	}
	else //Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_03"); //Czego jeszcze chcesz? Dosta�e� ju� z�oto, wi�c wyno� si� st�d!
	};
	
	AI_StopProcessInfos (self); 
};


//###########################################
//##
//##	Kapitel 3
//##
//###########################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_Kap3_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_Kap3_EXIT_Condition;
	information	= DIA_Gritta_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//		Perm3U4U5
// ************************************************************

//------------------------------------
var int GrittaXP_Once;
//-----------------------------

INSTANCE DIA_Gritta_Perm3U4U5(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 31;
	condition	= DIA_Gritta_Perm3U4U5_Condition;
	information	= DIA_Gritta_Perm3U4U5_Info;
	permanent	= TRUE;
	description = "Co s�ycha�?";
};                       
FUNC INT DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gritta_Perm3U4U5_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_00"); //Co s�ycha�?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_01"); //Wszystko tutaj schodzi na psy. Gdziekolwiek si� cz�owiek nie obejrzy, wsz�dzie przemoc i grabie�e. Wyobra� sobie, �e zamordowali nawet jednego paladyna.
			
			Info_ClearChoices (DIA_Gritta_Perm3U4U5);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,DIALOG_BACK,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Takich rzeczy nie mo�na unikn�� w czasie wojny.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Wszystko b�dzie dobrze.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Co s�ysza�a�?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_02"); //Och, tak si� ciesz�, �e Lord Hagen wypu�ci� tego najemnika.
			AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_03"); //A jakie to ma znaczenie?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_04"); //Zastan�w si� przez chwil�. Czy s�dzisz, �e najemnicy staliby spokojnie i przygl�dali si�, jak wieszaj� jednego z nich?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_05"); //Nie! Pr�bowaliby go uwolni�, a wtedy na pewno dosz�oby do rozlewu krwi.
		};	
	}
	else if (Kapitel == 5)	
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_06"); //Paladyni przygotowuj� si� chyba do opuszczenia tego miejsca.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_07"); //Wszystko po staremu, ale nie chc� narzeka�.
	};
};

FUNC VOID DIA_Gritta_Perm3U4U5_BACK ()
{
	Info_ClearChoices (DIA_Gritta_Perm3U4U5);
};

FUNC VOID DIA_Gritta_Perm3U4U5_War ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_War_15_00"); //Takich rzeczy nie mo�na unikn�� w czasie wojny.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_01"); //Tak, to wszystko wina tej okropnej wojny. Wszyscy cierpi� i zastanawiaj� si�, jak uda im si� przetrwa�.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_02"); //Czasami zadaj� sobie pytanie, za jakie grzechy Innos zes�a� na mnie tak straszliw� kar�.
};

FUNC VOID DIA_Gritta_Perm3U4U5_TurnsGood ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //Wszystko b�dzie dobrze.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //Pr�bujesz mnie pocieszy�. Dzi�kuj�, to mi�e.
	
	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};	
};

FUNC VOID DIA_Gritta_Perm3U4U5_Rumors ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_Rumors_15_00"); //Co s�ysza�a�?
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01"); //Tylko to, co ludzie powtarzaj� sobie na ulicach.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02"); //Podobno ju� schwytali morderc�, ale nie wiem, czy to prawda.
};












