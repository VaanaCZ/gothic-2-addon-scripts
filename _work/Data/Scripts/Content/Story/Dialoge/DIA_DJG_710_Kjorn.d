
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
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //¡Oye, ven aquí!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //¿Qué es lo que quieres?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //El valle es un lugar peligroso, y sin el equipo adecuado no vas a tardar en morir.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //Y supongo que tú tienes el equipo adecuado.
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //Lo has adivinado. Podría llegar a vendértelo.
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
	description	= "¿Qué puedes ofrecerme?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //¿Qué puedes ofrecerme?

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
	description	= "¿También vendes información?";
				
};

FUNC INT DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_SellInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_SellInfos_15_00"); //¿También vendes información?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //Depende. Por el precio adecuado, te contaré todo lo que sé.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //¿Cuánto cobras?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Esto... no sabría que decirte. No obstante, creo que 50 monedas de oro por cada dato que te dé es un precio justo.
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
	description	= "Necesito información.";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //Necesito información.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //¡50 monedas de oro!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"Es demasiado caro.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"Sí, ten.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //Es demasiado caro.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //Sí, ten.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //Ahora dime...
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	
	//----- Zurück -----
	
	Info_AddChoice (DIA_Kjorn_BuyInfos,DIALOG_BACK,DIA_Kjorn_BuyInfos_Back);
	
	//----- Die Drachen -----
	
	if KjornToldDragon == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... acerca de los dragones.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if KjornToldDragon == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... más acerca de los dragones.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... acerca del Valle de las Minas.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... más acerca del Valle de las Minas.",DIA_Kjorn_BuyInfos_Colony2);
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
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... más acerca de los orcos.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zurück -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //Oye, devuélveme el dinero. He cambiado de idea.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Haz lo que quieras.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //Háblame de los dragones.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //Los dragones son criaturas antiguas y de increíble poder. Antaño había miles de ellos en el mundo.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //No obstante, han pasado más de cien años desde la última vez que se vio a uno de ellos.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Su sangre arde como el aceite hirviendo, y si te miran a los ojos, te petrifican el corazón. Al menos eso he oído...
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //Cuéntame algo más de los dragones.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //No todos los dragones son iguales.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //Algunos pueden cubrir el suelo con una capa de hielo de varios metros de espesor.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //Otros prefieren vivir en ciénagas, o en volcanes.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"Kjorn, el cazador de dragones, cree que hay diferentes tipos de dragones. Algunos prefieren los lugares fríos y húmedos, mientras que otros prefieren el fuego."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //Háblame del Valle de las Minas.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //El Valle de las Minas de Khorinis es famoso en todo el país por su mineral mágico.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //Estas montañas son el único lugar que cuentan con un yacimiento de mineral mágico.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Un arma forjada de este mineral es prácticamente irrompible y atraviesa la armadura más robusta.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Hasta hace unas semanas, una barrera mágica rodeaba todo el valle. Era impenetrable, y nadie podía salir.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //Cuéntame algo más del Valle de las Minas.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //El valle ha cambiado mucho estos últimos días.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Cuando llegaron los orcos también aparecieron otras criaturas terribles, nunca vistas en esta región.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //Dicen que aún quedan unos cuantos cazadores solitarios, pero no sé siquiera si siguen vivos.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //Parece que todas las criaturas de Beliar han llegado en tropel a este valle.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //Háblame del castillo.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Se encuentra prácticamente en el centro del Valle de las Minas.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //Cuando el valle aún era una prisión, los magnates del mineral controlaban todo el comercio de mineral desde allí.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //Háblame de los orcos.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Los orcos no llevan por aquí mucho tiempo, al menos los que están frente al castillo.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Me pregunto si están bien organizados. Los orcos suelen atacar a ciegas, en cualquier circunstancia.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Estos orcos esperan el momento adecuado. Esperan, pero no se a qué.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Cuéntame algo más de los orcos.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Los jefes de los orcos son guerreros de élite Esos guerreros son muy fuertes y llevan armaduras resistentes. Vencerlos es prácticamente imposible.
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
	description	= "¡He matado a todos los dragones!";
				
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
	AI_Output	(other,self ,"DIA_Kjorn_AllDragonsDead_15_00"); //¡He matado a todos los dragones!
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //(Se ríe) Ya, y yo soy paladín.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //A lo mejor has matado a uno, pero ¿a todos? Búscate a alguien que te crea.
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


