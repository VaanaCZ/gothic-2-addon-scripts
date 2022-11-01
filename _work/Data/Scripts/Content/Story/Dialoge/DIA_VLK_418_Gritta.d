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
	AI_Output (self ,other,"DIA_Gritta_Hello_16_00"); //Czego tutaj chcesz? Jeśli przyszedłeś na żebry, to muszę cię rozczarować. Jestem biedną wdową.
	AI_Output (self ,other,"DIA_Gritta_Hello_16_01"); //Nazywam się Gritta. Od kiedy umarł mój mąż, prowadzę gospodarstwo mojego wuja, Thorbena.
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
	description = "Przysyła mnie Matteo. Wciąż jesteś mu winna złoto.";
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
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_15_00"); //Przysyła mnie Matteo. Wciąż jesteś mu winna złoto.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_01"); //Chce dostać pieniądze? Niby za co? Dostarczone ubrania były wadliwe, wykonane z kiepskich materiałów i źle skrojone.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_02"); //A widziałeś te kolory? To nie jest towar, który zamówiłam. To jest zwyczajne wyłudzenie!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_03"); //Kiedy jeszcze mój mąż chodził po tym świecie, ta gnida nigdy by się na to nie odważyła. Och, mój biedny mąż...

	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Dość tego. Gdzie złoto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue01 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue01_16_00"); //Był takim dobrym człowiekiem. Przystojny, pracowity, sympatyczny. Mieliśmy wszystko - pieniądze, szczęście...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_01"); //Czasami dostawaliśmy nawet zaproszenia na przeróżne imprezy organizowane przez arystokrację. Ach, te wszystkie piękne ubrania, te fryzury...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_02"); //Te wykwintne potrawy i kulturalne rozmowy. Kiedyś wszystko było lepsze. Nikt nie odważyłby się poniżać biednej wdowy tak idiotycznymi roszczeniami.
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Dość tego. Gdzie złoto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue02);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue02 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue02_16_00"); //Co mam teraz zrobić? Moje zarobki pokrywają jedynie najbardziej podstawowe potrzeby, a i to z ledwością. Na ulicach widzi się coraz więcej biedy...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_01"); //Ludzie muszą sobie wszystkiego odmawiać. Od tygodni nie przypłynął tu żaden statek. Mój mąż był kapitanem statku handlowego - a raczej jego właścicielem...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_02"); //Z dalekich podróży zawsze przywoził mi jakieś prezenty - kosztowne tkaniny z kontynentu, drogie przyprawy z południowych krain...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Dość tego. Gdzie złoto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue03);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue03 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue03_16_00"); //Większość ludzi nawet nie słyszała o takich rzeczach. Jednak pewnego dnia dostałam wiadomość, że Gritta zatonęła. Tak się nazywał statek mojego męża. Nazwał go moim imieniem...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue03_16_01"); //...z miłości do mnie. Płakałam i modliłam się, aby mój mąż przeżył tę katastrofę, każdego dnia wyglądałam jego powrotu, albo chociaż jakiejś wiadomości, ale na próżno...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_02"); //Niech Innos zlituje się nad jego duszą. Niech spoczywa w pokoju. Od czasu jego śmierci mam tylko same problemy, a teraz jeszcze ten bezduszny, chciwy Matteo...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_03"); //...chce odebrać mi resztki moich oszczędności. Proszę, zlituj się nad nieszczęsną kobietą. Gdyby mój mąż nadal żył, ta gnida nigdy by się na to nie odważyła... Och, mój biedny mąż...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Dość tego. Gdzie złoto?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Kontynuuj...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_WhereMoney ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_WhereMoney_15_00"); //Dość tego. Gdzie złoto?
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01"); //Ale ja nie mam żadnych pieniędzy, jestem tylko biedną wdową!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Dawaj kasę albo oberwiesz...",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Wygląda więc na to, że będziemy musieli sprzedać twoje graty...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Zapłacę za ciebie.",DIA_Gritta_WantsMoney_IWillPay);
};
FUNC VOID DIA_Gritta_WantsMoney_EnoughStuff ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //Sprzedamy po prostu kilka twoich ubrań. Jestem pewien, że masz jeszcze jakieś drogie suknie w swojej garderobie...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //Jak śmiesz, troglodyto! Dobrze, weź to złoto.
	B_GiveInvItems (self,other,ItMi_Gold, 100); 
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //Widzisz, to nie było takie trudne.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //A teraz wynoś się z mojego domu.
	
	Gritta_GoldGiven = TRUE;
	
	AI_StopProcessInfos (self); 
};
func VOID DIA_Gritta_WantsMoney_IWillPay ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_00"); //Zapłacę za ciebie.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_01"); //Zrobiłbyś to? Och, wiedziałam, że nie jesteś takim chciwym draniem jak Matteo!
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_02"); //Tak, tak, to drobiazg.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_03"); //Wróć tutaj, kiedy już to załatwisz. Chciałabym ci okazać swoją wdzięczność.
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	
	Gritta_WantPay = TRUE;
};
FUNC VOID DIA_Gritta_WantsMoney_BeatUp ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_BeatUp_15_00"); //Dawaj kasę albo oberwiesz...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_BeatUp_16_01"); //Jesteś zwykłym oprychem. No dalej, sięgnij po broń, a wezwę straż!
	
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
	AI_Output (self, other, "DIA_Gritta_WINE_16_00"); //To było bardzo szlachetne, że zgodziłeś się za mnie zapłacić. Chciałabym okazać ci moją wdzięczność.
	AI_Output (self, other, "DIA_Gritta_WINE_16_01"); //Oto butelka wina, którą mój mąż, niechaj Innos przyjmie do siebie jego duszę, przywiózł z południowych wysp.
	AI_Output (self, other, "DIA_Gritta_WINE_16_02"); //Opowiem o tym, co dla mnie zrobiłeś, wszystkim moim znajomym. Jest jeszcze na tym świecie ktoś, kto wie co to honor, i kto...
	AI_Output (other, self, "DIA_Gritta_WINE_15_03"); //Tak, oczywiście, to drobiazg.

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
		AI_Output (self, other, "DIA_Gritta_PERM_16_00"); //Dopóki w tym mieście są tacy jak ty, wierzę, że przyjdą jeszcze lepsze czasy.
	}
	else if (Gritta_WantPay == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_01"); //Wróć, kiedy już załatwisz sprawę z tym niegodziwcem.
	}
	else if (Gritta_Threatened == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_02"); //Czemu tak stoisz jak kompletny idiota? I tak nie odważysz się mnie zaatakować!
	}
	else //Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_03"); //Czego jeszcze chcesz? Dostałeś już złoto, więc wynoś się stąd!
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
	description = "Co słychać?";
};                       
FUNC INT DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gritta_Perm3U4U5_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_00"); //Co słychać?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_01"); //Wszystko tutaj schodzi na psy. Gdziekolwiek się człowiek nie obejrzy, wszędzie przemoc i grabieże. Wyobraź sobie, że zamordowali nawet jednego paladyna.
			
			Info_ClearChoices (DIA_Gritta_Perm3U4U5);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,DIALOG_BACK,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Takich rzeczy nie można uniknąć w czasie wojny.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Wszystko będzie dobrze.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Co słyszałaś?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_02"); //Och, tak się cieszę, że Lord Hagen wypuścił tego najemnika.
			AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_03"); //A jakie to ma znaczenie?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_04"); //Zastanów się przez chwilę. Czy sądzisz, że najemnicy staliby spokojnie i przyglądali się, jak wieszają jednego z nich?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_05"); //Nie! Próbowaliby go uwolnić, a wtedy na pewno doszłoby do rozlewu krwi.
		};	
	}
	else if (Kapitel == 5)	
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_06"); //Paladyni przygotowują się chyba do opuszczenia tego miejsca.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_07"); //Wszystko po staremu, ale nie chcę narzekać.
	};
};

FUNC VOID DIA_Gritta_Perm3U4U5_BACK ()
{
	Info_ClearChoices (DIA_Gritta_Perm3U4U5);
};

FUNC VOID DIA_Gritta_Perm3U4U5_War ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_War_15_00"); //Takich rzeczy nie można uniknąć w czasie wojny.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_01"); //Tak, to wszystko wina tej okropnej wojny. Wszyscy cierpią i zastanawiają się, jak uda im się przetrwać.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_02"); //Czasami zadaję sobie pytanie, za jakie grzechy Innos zesłał na mnie tak straszliwą karę.
};

FUNC VOID DIA_Gritta_Perm3U4U5_TurnsGood ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //Wszystko będzie dobrze.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //Próbujesz mnie pocieszyć. Dziękuję, to miłe.
	
	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};	
};

FUNC VOID DIA_Gritta_Perm3U4U5_Rumors ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_Rumors_15_00"); //Co słyszałaś?
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01"); //Tylko to, co ludzie powtarzają sobie na ulicach.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02"); //Podobno już schwytali mordercę, ale nie wiem, czy to prawda.
};












