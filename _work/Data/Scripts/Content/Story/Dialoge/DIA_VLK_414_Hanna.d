// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Hanna_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_EXIT_Condition;
	information	= DIA_Hanna_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hanna_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Hanna_Hello(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Hello_Condition;
	information	= DIA_Hanna_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Hanna_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //�, z�kazn�k - ��mpak poslou��m?
};	

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
INSTANCE DIA_Hanna_Room(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 2;
	condition	= DIA_Hanna_Room_Condition;
	information	= DIA_Hanna_Room_Info;
	permanent	= FALSE;
	description	= "Hled�m pokoj.";
};                       

FUNC INT DIA_Hanna_Room_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Room_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_Room_15_00"); //Hled�m pokoj.
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //Tak to jsi na spr�vn�m m�st�.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //Jeden z paladin� mi nazna�il, �e bych tu mohl p�espat i zadarmo.
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //Kolik stoj� noc?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //V�bec nic.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //Ubytov�n� poutn�k� jde na ��et paladin�m.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //Tak�e tu m��u z�stat zadarmo?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Ano, ano.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //Prost� vyjdi po schodech nahoru.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //Je�t� tam m�me dv� postele voln�.
	//AI_Output (self ,other,"DIA_Hanna_Room_17_02"); //Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
INSTANCE DIA_Hanna_WhyPay(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 3;
	condition	= DIA_Hanna_WhyPay_Condition;
	information	= DIA_Hanna_WhyPay_Info;
	permanent	= FALSE;
	description	= "Pro� paladinov� za v�echno plat�?";
};                       

FUNC INT DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WhyPay_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //Pro� paladinov� za v�echno plat�?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //Nev�m, ale nejsp� v tom bude v�c v�c� najednou.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //Jednak cht�j�, aby se po ulici netoulala ��dn� pochybn� sebranka a zbyte�n� tu ned�lala bordel.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //A taky si mo�n� cht�j� na svou stranu naklonit potuln� kupce.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Te�, kdy� se sedl�ci bou��, je na�e z�sobov�n� z�visl� hlavn� na obchodn�c�ch.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //A krom� toho bych �ekla, �e taky cht�j� ve m�st� trochu pozvednout mor�lku.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Lord Andre dokonce na��dil, aby na �ibeni�n�m n�m�st� nal�vali jedno pivo zdarma.
};

//*****************************************
//	WerHier - PERM
//*****************************************
INSTANCE DIA_Hanna_WerHier(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 4;
	condition	= DIA_Hanna_WerHier_Condition;
	information	= DIA_Hanna_WerHier_Info;
	permanent	= TRUE;
	description	= "Kdo tady zrovna je?";
};                       

FUNC INT DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WerHier_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_08"); //Kdo tady zrovna je?
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //Skoro v�echno jsou potuln� trhovci.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //Aha.
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //A� t� ani nenapadne, �e bys jim �el "zkontrolovat" zbo��! Nechci tu m�t ��dn� nep��jemnosti!
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************

INSTANCE DIA_Hanna_City(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 5;
	condition	= DIA_Hanna_City_Condition;
	information	= DIA_Hanna_City_Info;
	permanent	= TRUE;
	description	= "M�l bych p�r ot�zek ohledn� m�sta...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //M�l bych p�r ot�zek ohledn� m�sta...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"Kde bych si tu mohl n�co nakoupit?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Pov�z mi n�co o m�st�.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //Kde bych si tu mohl n�co nakoupit?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //P��mo naproti dve��m je tr�i�t�, tam bys m�l naj�t v�echno, co pot�ebuje�.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //Na druh� stran� m�sta najde� p�r �emeslnick�ch kr�mk�. V�t�ina z nich le�� pobl� druh� m�stsk� br�ny.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //V p��stavu tak� m��e� zaj�t k ryb��i. Jeho obchod se nach�z� p��mo v p��stavu, najde� to snadno.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Pov�z mi n�co o m�st�.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Khorinis je jedn�m z nejbohat��ch m�st v kr�lovstv�, i kdy� te� to tak nevypad�.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //Ale od t� doby, co za�aly ty probl�my se sk�ety, se obchod t�m�� zastavil. Kr�l toti� naverboval do arm�dy celou kupeckou flotilu.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //To znamen�, �e do p��stavu te� ��dn� lodi nepluj� a z�soby zbo�� se rapidn� ten��. Spousta zdej��ch obyvatel se proto boj�, co bude d�l.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Nikdo nev� p�esn�, co n�m budoucnost p�inese. Vlastn� nem��eme d�lat nic jin�ho, ne� tu sed�t a �ekat, co se stane. Nezd� se, �e bychom mohli n�co zm�nit.
};



//##################################
//##
//##	Kapitel 3
//##
//##################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_Kap3_EXIT_Condition;
	information	= DIA_Hanna_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht�s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "Jak to jde?";
};                       
FUNC INT DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_AnyNews_15_00"); //Jak se vede?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //Nevypad�, �e by t� probl�my druh�ch lid� n�jak zvl᚝ zaj�maly.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Ano, jist�, samoz�ejm�.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"P�ijde na to.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"Vlastn� ne.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //Vlastn� ne.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //P�esn� jak ��k�m. Nikdo tu nemysl� na nic jin�ho ne� jenom na sebe. Tak�e co chce�?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //P�ijde na to.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //To jako �e p�ijde na to, co ti z toho k�pne.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //Takov� jako ty tu nem��u vyst�t.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Jo, jasn�.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //Co ty v�, sv�t je pln� p�ekvapen�. Ned�vno jsem d�lala po��dek ve zbo�� a p�i t� p��le�itosti jsem prodala �t�sek map Brahimovi, kartografovi dole v p��stavu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Bohu�el jsem ale vz�p�t� zjistila, �e mi chyb� jeden dokument.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //Po��t�m, �e se musel n�jak p�imotat mezi ty pap�ry.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //Nemohl bys mi ho p�in�st zp�tky?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Hann� se ztratil n�jak� dokument. Nejsp� j� zmizel v p��stavu - tam, kde s�dl� kartograf Brahim."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Nejsem ��dn� posl��ek.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"Co z toho budu m�t?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"Uvid�m, co se d� d�lat.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //Nejsem ��dn� posl��ek.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //Ch�pu - probl�my oby�ejn� �eny ti nestoj� za n�mahu. No dob�e, tak se o to budu muset postarat sama.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //Co z toho budu m�t?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //Aha, j� to v�d�la - nejsi o nic lep�� ne� ta l�za dole v p��stavu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //Tak�e co chce� po uboh� �en�?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"To nic.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"Taky bys ke mn� mohla b�t trochu vl�dn�j��.",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"Zlato.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Vlastn� nic.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //Aspo� �e v tob� zbyla trocha slu�nosti. Kdy� mi ten dokument p�inese�, dostane� ode m� 75 zla��k�.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //Taky bys ke mn� mohla b�t trochu vl�dn�j��.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //To je ale hnusn�! J�... zmiz odsud! Ty nevychovan� hulv�te!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //Zlato.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Nem��u ti nab�dnout v�c ne� mrzk� pen�z. No - cen�m si to na 50 zla��k�.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //Jestli se ti poda�� ten dokument z�skat zp�tky, d�m ti 50 zla��k�.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //Uvid�m, co se d� d�lat.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //To je od tebe mil�! Hodn� �t�st�!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //Kdy� mi ten dokument p�inese� zp�tky, odm�n�m se ti.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftst�ck?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "Myslelas tenhle dokument?";
};                       
FUNC INT DIA_Hanna_ThisLetter_Condition()
{
	if (MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_ThisLetter_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //Myslelas tenhle dokument?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Ano, to je p�esn� ono. D�kuji ti.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //A co m� odm�na?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //Ne tak zhurta. Tady m� pen�ze.
		
	CreateInvItems (self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems (self,other,ItMi_Gold,Hanna_PriceForLetter);
	
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP (XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hanna_PICKPOCKET (C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 900;
	condition	= DIA_Hanna_PICKPOCKET_Condition;
	information	= DIA_Hanna_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen (45, 25);
};
 
FUNC VOID DIA_Hanna_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hanna_PICKPOCKET);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_BACK 		,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};
	
func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};


// ************************************************************
//						Aus Keller
// ************************************************************

INSTANCE DIA_Hanna_AusKeller(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 11;
	condition	= DIA_Hanna_AusKeller_Condition;
	information	= DIA_Hanna_AusKeller_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems (other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_AusKeller_Info()
{	
	if (Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //Odkud... jsi to p�i�el?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //U tebe ve sklep� jsem na�el cosi velmi zaj�mav�ho.
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //A co jsi d�lal u m� ve sklep�?
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //To v� zatracen� dob�e!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //(chladn�) Nem�m pon�t�, o �em to mluv�.
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //(ned�v��iv�) Jen se na sebe pod�vej! Odkud jsi to p�i�el, co?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //(rozpa�it�) J�...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //(usm�je se) J� v�m!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //(spiklenecky) Nemus� mi nic ��kat - v�m v�echno.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //A� t� ani nenapadne n�co tady ukr�st, jasn�?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //U� se nem��eme hotelu d�le v�novat.
	};	
	
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************

INSTANCE DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Schuldenbuch_Condition;
	information	= DIA_Hanna_Schuldenbuch_Info;
	permanent	= FALSE;
	description	= "Pod�vej, jakou knihu tu m�m!";
};                       
FUNC INT DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_Schuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //Pod�vej, jakou knihu tu m�m!
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //Lehmarova ��etn� kniha. Jak jsi k n� p�i�el?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //No...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //Pokud u� ji Lehmar nem�, je to dobr� v�c. Stejn� bych ji ale rad�i ukryla u sebe.
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_GiveSchuldenbuch_Condition;
	information	= DIA_Hanna_GiveSchuldenbuch_Info;
	permanent	= FALSE;
	description = "Tum� - klidn� si tu knihu vezmi.";
};                       
FUNC INT DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_GiveSchuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Tum� - klidn� si tu knihu vezmi.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //D�ky.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Tady m� n�co za odm�nu.
	B_GiveInvItems (self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP (XP_Schuldenbuch);
	AI_Output (other, self, "DIA_Hanna_Add_15_49"); //Co jsi mi to dala?
	AI_Output (self, other, "DIA_Hanna_Add_17_48"); //Je to kl�� od br�ny bohatstv�.
};


// ************************************************************
// 			  				
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //Je v �krytu v�echno v po��dku?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //U� jsem nikoho z nich n�jakou dobu nevid�la.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //M�l bych sej�t tam dol� a trochu to tam pro�et�it.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Ano, ale rad�i bys o tom nem�l mluvit.
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //U� jsi zjistil, kde se skr�vaj� zlod�ji?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //(dom��liv�) Nem�m potuchy, o �em to mluv�.
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //Vtrhla sem domobrana - n�kdo vyzradil na�i skr��!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //Mn� nem�li co p�i��t, ale Cassia je mrtv� a jej� lid� taky!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //Ur�it� jsi to byl TY.
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //Tohle jsem koupila zvl᚝ pro tebe.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //St�lo m� to sice majlant, ale ty si to fakt zaslou��, ty svin� podraz�ck�.
};	

	
