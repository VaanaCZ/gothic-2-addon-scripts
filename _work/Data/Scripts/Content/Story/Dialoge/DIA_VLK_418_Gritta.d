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
	AI_Output (self ,other,"DIA_Gritta_Hello_16_00"); //Czego tutaj chcesz? Jeœli przyszed³eœ na ¿ebry, to muszê ciê rozczarowaæ. Jestem biedn¹ wdow¹.
	AI_Output (self ,other,"DIA_Gritta_Hello_16_01"); //Nazywam siê Gritta. Od kiedy umar³ mój m¹¿, prowadzê gospodarstwo mojego wuja, Thorbena.
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
	description = "Przysy³a mnie Matteo. Wci¹¿ jesteœ mu winna z³oto.";
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
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_15_00"); //Przysy³a mnie Matteo. Wci¹¿ jesteœ mu winna z³oto.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_01"); //Chce dostaæ pieni¹dze? Niby za co? Dostarczone ubrania by³y wadliwe, wykonane z kiepskich materia³ów i Ÿle skrojone.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_02"); //A widzia³eœ te kolory? To nie jest towar, który zamówi³am. To jest zwyczajne wy³udzenie!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_03"); //Kiedy jeszcze mój m¹¿ chodzi³ po tym œwiecie, ta gnida nigdy by siê na to nie odwa¿y³a. Och, mój biedny m¹¿...

	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Doœæ tego. Gdzie z³oto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue01 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue01_16_00"); //By³ takim dobrym cz³owiekiem. Przystojny, pracowity, sympatyczny. Mieliœmy wszystko - pieni¹dze, szczêœcie...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_01"); //Czasami dostawaliœmy nawet zaproszenia na przeró¿ne imprezy organizowane przez arystokracjê. Ach, te wszystkie piêkne ubrania, te fryzury...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_02"); //Te wykwintne potrawy i kulturalne rozmowy. Kiedyœ wszystko by³o lepsze. Nikt nie odwa¿y³by siê poni¿aæ biednej wdowy tak idiotycznymi roszczeniami.
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Doœæ tego. Gdzie z³oto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue02);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue02 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue02_16_00"); //Co mam teraz zrobiæ? Moje zarobki pokrywaj¹ jedynie najbardziej podstawowe potrzeby, a i to z ledwoœci¹. Na ulicach widzi siê coraz wiêcej biedy...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_01"); //Ludzie musz¹ sobie wszystkiego odmawiaæ. Od tygodni nie przyp³yn¹³ tu ¿aden statek. Mój m¹¿ by³ kapitanem statku handlowego - a raczej jego w³aœcicielem...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_02"); //Z dalekich podró¿y zawsze przywozi³ mi jakieœ prezenty - kosztowne tkaniny z kontynentu, drogie przyprawy z po³udniowych krain...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Doœæ tego. Gdzie z³oto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue03);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue03 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue03_16_00"); //Wiêkszoœæ ludzi nawet nie s³ysza³a o takich rzeczach. Jednak pewnego dnia dosta³am wiadomoœæ, ¿e Gritta zatonê³a. Tak siê nazywa³ statek mojego mê¿a. Nazwa³ go moim imieniem...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue03_16_01"); //...z mi³oœci do mnie. P³aka³am i modli³am siê, aby mój m¹¿ prze¿y³ tê katastrofê, ka¿dego dnia wygl¹da³am jego powrotu, albo chocia¿ jakiejœ wiadomoœci, ale na pró¿no...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_02"); //Niech Innos zlituje siê nad jego dusz¹. Niech spoczywa w pokoju. Od czasu jego œmierci mam tylko same problemy, a teraz jeszcze ten bezduszny, chciwy Matteo...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_03"); //...chce odebraæ mi resztki moich oszczêdnoœci. Proszê, zlituj siê nad nieszczêsn¹ kobiet¹. Gdyby mój m¹¿ nadal ¿y³, ta gnida nigdy by siê na to nie odwa¿y³a... Och, mój biedny m¹¿...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Doœæ tego. Gdzie z³oto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_WhereMoney ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_WhereMoney_15_00"); //Doœæ tego. Gdzie z³oto?
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01"); //Ale ja nie mam ¿adnych pieniêdzy, jestem tylko biedn¹ wdow¹!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Dawaj kasê albo oberwiesz...",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Wygl¹da wiêc na to, ¿e bêdziemy musieli sprzedaæ twoje graty...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Zap³acê za ciebie.",DIA_Gritta_WantsMoney_IWillPay);
};
FUNC VOID DIA_Gritta_WantsMoney_EnoughStuff ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //Sprzedamy po prostu kilka twoich ubrañ. Jestem pewien, ¿e masz jeszcze jakieœ drogie suknie w swojej garderobie...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //Jak œmiesz, troglodyto! Dobrze, weŸ to z³oto.
	B_GiveInvItems (self,other,ItMi_Gold, 100); 
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //Widzisz, to nie by³o takie trudne.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //A teraz wynoœ siê z mojego domu.
	
	Gritta_GoldGiven = TRUE;
	
	AI_StopProcessInfos (self); 
};
func VOID DIA_Gritta_WantsMoney_IWillPay ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_00"); //Zap³acê za ciebie.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_01"); //Zrobi³byœ to? Och, wiedzia³am, ¿e nie jesteœ takim chciwym draniem jak Matteo!
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_02"); //Tak, tak, to drobiazg.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_03"); //Wróæ tutaj, kiedy ju¿ to za³atwisz. Chcia³abym ci okazaæ swoj¹ wdziêcznoœæ.
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	
	Gritta_WantPay = TRUE;
};
FUNC VOID DIA_Gritta_WantsMoney_BeatUp ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_BeatUp_15_00"); //Dawaj kasê albo oberwiesz...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_BeatUp_16_01"); //Jesteœ zwyk³ym oprychem. No dalej, siêgnij po broñ, a wezwê stra¿!
	
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
	AI_Output (self, other, "DIA_Gritta_WINE_16_00"); //To by³o bardzo szlachetne, ¿e zgodzi³eœ siê za mnie zap³aciæ. Chcia³abym okazaæ ci moj¹ wdziêcznoœæ.
	AI_Output (self, other, "DIA_Gritta_WINE_16_01"); //Oto butelka wina, któr¹ mój m¹¿, niechaj Innos przyjmie do siebie jego duszê, przywióz³ z po³udniowych wysp.
	AI_Output (self, other, "DIA_Gritta_WINE_16_02"); //Opowiem o tym, co dla mnie zrobi³eœ, wszystkim moim znajomym. Jest jeszcze na tym œwiecie ktoœ, kto wie co to honor, i kto...
	AI_Output (other, self, "DIA_Gritta_WINE_15_03"); //Tak, oczywiœcie, to drobiazg.

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
		AI_Output (self, other, "DIA_Gritta_PERM_16_00"); //Dopóki w tym mieœcie s¹ tacy jak ty, wierzê, ¿e przyjd¹ jeszcze lepsze czasy.
	}
	else if (Gritta_WantPay == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_01"); //Wróæ, kiedy ju¿ za³atwisz sprawê z tym niegodziwcem.
	}
	else if (Gritta_Threatened == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_02"); //Czemu tak stoisz jak kompletny idiota? I tak nie odwa¿ysz siê mnie zaatakowaæ!
	}
	else //Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_03"); //Czego jeszcze chcesz? Dosta³eœ ju¿ z³oto, wiêc wynoœ siê st¹d!
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
	description = "Co s³ychaæ?";
};                       
FUNC INT DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gritta_Perm3U4U5_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_00"); //Co s³ychaæ?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_01"); //Wszystko tutaj schodzi na psy. Gdziekolwiek siê cz³owiek nie obejrzy, wszêdzie przemoc i grabie¿e. WyobraŸ sobie, ¿e zamordowali nawet jednego paladyna.
			
			Info_ClearChoices (DIA_Gritta_Perm3U4U5);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,DIALOG_BACK,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Takich rzeczy nie mo¿na unikn¹æ w czasie wojny.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Wszystko bêdzie dobrze.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Co s³ysza³aœ?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_02"); //Och, tak siê cieszê, ¿e Lord Hagen wypuœci³ tego najemnika.
			AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_03"); //A jakie to ma znaczenie?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_04"); //Zastanów siê przez chwilê. Czy s¹dzisz, ¿e najemnicy staliby spokojnie i przygl¹dali siê, jak wieszaj¹ jednego z nich?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_05"); //Nie! Próbowaliby go uwolniæ, a wtedy na pewno dosz³oby do rozlewu krwi.
		};	
	}
	else if (Kapitel == 5)	
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_06"); //Paladyni przygotowuj¹ siê chyba do opuszczenia tego miejsca.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_07"); //Wszystko po staremu, ale nie chcê narzekaæ.
	};
};

FUNC VOID DIA_Gritta_Perm3U4U5_BACK ()
{
	Info_ClearChoices (DIA_Gritta_Perm3U4U5);
};

FUNC VOID DIA_Gritta_Perm3U4U5_War ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_War_15_00"); //Takich rzeczy nie mo¿na unikn¹æ w czasie wojny.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_01"); //Tak, to wszystko wina tej okropnej wojny. Wszyscy cierpi¹ i zastanawiaj¹ siê, jak uda im siê przetrwaæ.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_02"); //Czasami zadajê sobie pytanie, za jakie grzechy Innos zes³a³ na mnie tak straszliw¹ karê.
};

FUNC VOID DIA_Gritta_Perm3U4U5_TurnsGood ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //Wszystko bêdzie dobrze.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //Próbujesz mnie pocieszyæ. Dziêkujê, to mi³e.
	
	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};	
};

FUNC VOID DIA_Gritta_Perm3U4U5_Rumors ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_Rumors_15_00"); //Co s³ysza³aœ?
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01"); //Tylko to, co ludzie powtarzaj¹ sobie na ulicach.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02"); //Podobno ju¿ schwytali mordercê, ale nie wiem, czy to prawda.
};












