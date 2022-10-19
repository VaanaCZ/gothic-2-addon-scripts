
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kjorn_EXIT   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 999;
	condition   = DIA_Kjorn_EXIT_Condition;
	information = DIA_Kjorn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kjorn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_Kjorn_Hello   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 4;
	condition   = DIA_Kjorn_Hello_Condition;
	information = DIA_Kjorn_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;	
};

FUNC INT DIA_Kjorn_Hello_Condition()
{
	IF (Npc_GetDistToNpc (self,hero) < 300)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_Hello_Info()
{
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //Hej, podejdŸ tu!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //Czego chcesz?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //Dolina jest niebezpiecznym miejscem, bez odpowiedniego ekwipunku nie dasz tam sobie rady.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //Rozumiem, ¿e TY posiadasz w³aœciwy ekwipunek?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //Zgad³eœ. I wiesz co? Chêtnie ci go sprzedam.
};

//*********************************************************************
//	Info TRADE 
//*********************************************************************
INSTANCE DIA_Kjorn_TRADE   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 4;
	condition   = DIA_Kjorn_TRADE_Condition;
	information = DIA_Kjorn_TRADE_Info;
	Trade		= TRUE;
	permanent   = TRUE;
	description	= "Co mo¿esz mi zaoferowaæ?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //Co mo¿esz mi zaoferowaæ?

};

//*********************************************************************
//	Verkaufst du auch Informationen? 
//*********************************************************************
INSTANCE DIA_Kjorn_SellInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_SellInfos_Condition;
	information = DIA_Kjorn_SellInfos_Info;
	permanent   = FALSE;
	description	= "Czy sprzedajesz równie¿ informacje?";
				
};

FUNC INT DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_SellInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_SellInfos_15_00"); //Czy sprzedajesz równie¿ informacje?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //To zale¿y. Za odpowiedni¹ cenê powiem ci wszystko, co wiem.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //Ile chcesz za informacje?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Hmmm... Sam nie wiem. 50 sztuk z³ota za ka¿d¹ udzielon¹ ci informacjê wydaje mi siê rozs¹dn¹ cen¹.
};

//*********************************************************************
//	Ich brauche Infos über.. 
//*********************************************************************
INSTANCE DIA_Kjorn_BuyInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_BuyInfos_Condition;
	information = DIA_Kjorn_BuyInfos_Info;
	permanent   = TRUE;
	description	= "Potrzebujê paru informacji.";
				
};

FUNC INT DIA_Kjorn_BuyInfos_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Kjorn_SellInfos))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //Potrzebujê informacji.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //50 sztuk z³ota!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"To trochê za drogo.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"Tak, proszê.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //To dla mnie za drogo.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //Proszê.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //A teraz powiedz mi...
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	
	//----- Zurück -----
	
	Info_AddChoice (DIA_Kjorn_BuyInfos,DIALOG_BACK,DIA_Kjorn_BuyInfos_Back);
	
	//----- Die Drachen -----
	
	if KjornToldDragon == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o smokach.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if KjornToldDragon == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o smokach - dok³adniej.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o Górniczej Dolinie.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o Górniczej Dolinie - dok³adniej.",DIA_Kjorn_BuyInfos_Colony2);
	};
	
	//----- die Burg -----
	
	if KJornToldOldCamp == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o zamku.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	
	//----- Die Orks -----
	
	if KjornToldOrks == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o orkach.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if KjornToldOrks == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o orkach - dok³adniej.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zurück -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //Wiesz co, zwróæ mi moje pieni¹dze, rozmyœli³em siê.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Proszê bardzo.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //Opowiedz mi o smokach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //Smoki to pradawne, niewyobra¿alnie potê¿ne istoty. Kiedyœ tysi¹ce tych stworzeñ zamieszkiwa³o ca³y œwiat.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //Jednak up³ynê³o ju¿ ponad sto lat, odk¹d widziano ostatniego smoka.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Ich krew jest gor¹ca niczym wrz¹cy olej. Jeœli spojrzysz im prosto w oczy, twoje serce obróci siê w kamieñ. Tak s³ysza³em...
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //Opowiedz mi wiêcej o smokach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //Smoki ró¿ni¹ siê miêdzy sob¹.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //Niektóre z nich mog³yby pokryæ ca³y œwiat warstw¹ lodu grub¹ na kilka stóp.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //Inne lubi¹ mieszkaæ na bagnach lub w wulkanach.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"£owca smoków Kjorn uwa¿a, ¿e istniej¹ ró¿ne rodzaje smoków. Niektóre z nich lubi¹ zimne, wilgotne miejsca, inne wol¹ ogieñ."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //Opowiedz mi o Górniczej Dolinie.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //Górnicza Dolina Khorinis s³ynie w ca³ym kraju ze swojej magicznej rudy.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //Mo¿na j¹ znaleŸæ tylko w tych górach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Broñ wykuta z takiej rudy jest praktycznie niezniszczalna. Mo¿na ni¹ przeci¹æ nawet najtwardszy pancerz.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Jeszcze parê tygodni temu ca³¹ Dolinê otacza³a magiczna Bariera. Kto raz j¹ przekroczy³, zostawa³ tam na ca³e ¿ycie.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //Opowiedz mi wiêcej o Górniczej Dolinie.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //W ci¹gu paru ostatnich dni Dolina bardzo siê zmieni³a.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Przybyli do niej orkowie, a wraz z nimi wszelkie mo¿liwe potwory, jakie tylko mo¿na sobie wyobraziæ.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //Podobno w okolicy przebywaj¹ jacyœ myœliwi, jednak nie wiadomo nawet, czy jeszcze ¿yj¹.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //Wygl¹da to tak, jakby wszystkie stworzenia Beliara przyby³y do tej jednej Doliny.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //Opowiedz mi o zamku.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Znajduje siê praktycznie w samym œrodku Górniczej Doliny.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //Kiedy jeszcze dolina by³a wykorzystywana jako wiêzienie, lokalni baronowie kontrolowali st¹d handel rud¹.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //Opowiedz mi o orkach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Orkowie pojawili siê tutaj dopiero niedawno. Przynajmniej ci sprzed zamku.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Dziwi mnie, jak dobrze s¹ zorganizowani. Orkowie przewa¿nie atakuj¹ na oœlep, niezale¿nie od okolicznoœci.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Ci orkowie najwyraŸniej próbuj¹ zyskaæ na czasie. Czekaj¹ na coœ, nie wiemy tylko na co.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Opowiedz mi wiêcej o orkach.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Orkami dowodz¹ elitarni wojownicy. S¹ oni niezwykle silni i nosz¹ bardzo mocne zbroje. Praktycznie nie mo¿na ich pokonaæ.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //Kiedyœ widzia³em, jak jeden z nich powali³ ogromny d¹b zaledwie jednym ciosem swojego topora.
	
	KjornToldOrks = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kjorn_AllDragonsDead   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_AllDragonsDead_Condition;
	information = DIA_Kjorn_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "Zabi³em wszystkie smoki!";
				
};

FUNC INT DIA_Kjorn_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_AllDragonsDead_15_00"); //Zabi³em wszystkie smoki!
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //Tak, pewnie. A ja zosta³em paladynem.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //Mog³eœ zabiæ JEDNEGO, ale WSZYSTKIE? Ciekawe kto ci w to uwierzy.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kjorn_PICKPOCKET (C_INFO)
{
	npc			= DJG_710_Kjorn;
	nr			= 900;
	condition	= DIA_Kjorn_PICKPOCKET_Condition;
	information	= DIA_Kjorn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Kjorn_PICKPOCKET_Condition()
{
	C_Beklauen (47, 75);
};
 
FUNC VOID DIA_Kjorn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kjorn_PICKPOCKET);
	Info_AddChoice		(DIA_Kjorn_PICKPOCKET, DIALOG_BACK 		,DIA_Kjorn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kjorn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kjorn_PICKPOCKET_DoIt);
};

func void DIA_Kjorn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kjorn_PICKPOCKET);
};
	
func void DIA_Kjorn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kjorn_PICKPOCKET);
};


