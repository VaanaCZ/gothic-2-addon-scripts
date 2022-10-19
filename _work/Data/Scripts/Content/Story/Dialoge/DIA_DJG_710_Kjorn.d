
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
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //�Oye, ven aqu�!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //�Qu� es lo que quieres?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //El valle es un lugar peligroso, y sin el equipo adecuado no vas a tardar en morir.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //Y supongo que t� tienes el equipo adecuado.
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //Lo has adivinado. Podr�a llegar a vend�rtelo.
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
	description	= "�Qu� puedes ofrecerme?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //�Qu� puedes ofrecerme?

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
	description	= "�Tambi�n vendes informaci�n?";
				
};

FUNC INT DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_SellInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_SellInfos_15_00"); //�Tambi�n vendes informaci�n?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //Depende. Por el precio adecuado, te contar� todo lo que s�.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //�Cu�nto cobras?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Esto... no sabr�a que decirte. No obstante, creo que 50 monedas de oro por cada dato que te d� es un precio justo.
};

//*********************************************************************
//	Ich brauche Infos �ber.. 
//*********************************************************************
INSTANCE DIA_Kjorn_BuyInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_BuyInfos_Condition;
	information = DIA_Kjorn_BuyInfos_Info;
	permanent   = TRUE;
	description	= "Necesito informaci�n.";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //Necesito informaci�n.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //�50 monedas de oro!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"Es demasiado caro.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"S�, ten.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //Es demasiado caro.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //S�, ten.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //Ahora dime...
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	
	//----- Zur�ck -----
	
	Info_AddChoice (DIA_Kjorn_BuyInfos,DIALOG_BACK,DIA_Kjorn_BuyInfos_Back);
	
	//----- Die Drachen -----
	
	if KjornToldDragon == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... acerca de los dragones.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if KjornToldDragon == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... m�s acerca de los dragones.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... acerca del Valle de las Minas.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... m�s acerca del Valle de las Minas.",DIA_Kjorn_BuyInfos_Colony2);
	};
	
	//----- die Burg -----
	
	if KJornToldOldCamp == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... acerca del castillo.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	
	//----- Die Orks -----
	
	if KjornToldOrks == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... acerca de los orcos.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if KjornToldOrks == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... m�s acerca de los orcos.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zur�ck -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //Oye, devu�lveme el dinero. He cambiado de idea.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Haz lo que quieras.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //H�blame de los dragones.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //Los dragones son criaturas antiguas y de incre�ble poder. Anta�o hab�a miles de ellos en el mundo.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //No obstante, han pasado m�s de cien a�os desde la �ltima vez que se vio a uno de ellos.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Su sangre arde como el aceite hirviendo, y si te miran a los ojos, te petrifican el coraz�n. Al menos eso he o�do...
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //Cu�ntame algo m�s de los dragones.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //No todos los dragones son iguales.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //Algunos pueden cubrir el suelo con una capa de hielo de varios metros de espesor.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //Otros prefieren vivir en ci�nagas, o en volcanes.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"Kjorn, el cazador de dragones, cree que hay diferentes tipos de dragones. Algunos prefieren los lugares fr�os y h�medos, mientras que otros prefieren el fuego."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //H�blame del Valle de las Minas.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //El Valle de las Minas de Khorinis es famoso en todo el pa�s por su mineral m�gico.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //Estas monta�as son el �nico lugar que cuentan con un yacimiento de mineral m�gico.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Un arma forjada de este mineral es pr�cticamente irrompible y atraviesa la armadura m�s robusta.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Hasta hace unas semanas, una barrera m�gica rodeaba todo el valle. Era impenetrable, y nadie pod�a salir.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //Cu�ntame algo m�s del Valle de las Minas.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //El valle ha cambiado mucho estos �ltimos d�as.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Cuando llegaron los orcos tambi�n aparecieron otras criaturas terribles, nunca vistas en esta regi�n.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //Dicen que a�n quedan unos cuantos cazadores solitarios, pero no s� siquiera si siguen vivos.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //Parece que todas las criaturas de Beliar han llegado en tropel a este valle.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //H�blame del castillo.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Se encuentra pr�cticamente en el centro del Valle de las Minas.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //Cuando el valle a�n era una prisi�n, los magnates del mineral controlaban todo el comercio de mineral desde all�.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //H�blame de los orcos.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Los orcos no llevan por aqu� mucho tiempo, al menos los que est�n frente al castillo.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Me pregunto si est�n bien organizados. Los orcos suelen atacar a ciegas, en cualquier circunstancia.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Estos orcos esperan el momento adecuado. Esperan, pero no se a qu�.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Cu�ntame algo m�s de los orcos.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Los jefes de los orcos son guerreros de �lite Esos guerreros son muy fuertes y llevan armaduras resistentes. Vencerlos es pr�cticamente imposible.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //Una vez vi que uno derribaba un roble adulto de un solo hachazo.
	
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
	description	= "�He matado a todos los dragones!";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_AllDragonsDead_15_00"); //�He matado a todos los dragones!
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //(Se r�e) Ya, y yo soy palad�n.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //A lo mejor has matado a uno, pero �a todos? B�scate a alguien que te crea.
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


