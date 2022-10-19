// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Alwin_EXIT(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 999;
	condition	= DIA_Alwin_EXIT_Condition;
	information	= DIA_Alwin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alwin_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Alwin_PICKPOCKET (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 900;
	condition	= DIA_Alwin_PICKPOCKET_Condition;
	information	= DIA_Alwin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Alwin_PICKPOCKET_Condition()
{
	C_Beklauen (20, 10);
};
 
FUNC VOID DIA_Alwin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alwin_PICKPOCKET);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_BACK 		,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
	
func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
//***************************************************
//		Schafe
//***************************************************
INSTANCE DIA_Alwin_Sheep(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 3;
	condition	= DIA_Alwin_Sheep_Condition;
	information	= DIA_Alwin_Sheep_Info;
	permanent	= FALSE;
	description = "¿Esas ovejas son tuyas?";
};                       
FUNC INT DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Alwin_Sheep_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Sheep_15_00"); //¿Esas ovejas son tuyas?
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_01"); //La única que me pertenece es la que responde al nombre de Lucy. (Se ríe) Ésa es mi mujer, Lucy.
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_02"); //Las ovejas pertenecen a la milicia. Todas las ovejas que recogen de los granjeros me las traen a mí.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_Fellan(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_Fellan_Condition;
	information	= DIA_Alwin_Fellan_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Alwin_Fellan_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Fellan_Info()
{	
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_00"); //Chico, el martilleo de ese lunático me está destrozando.
	AI_Output (other, self,"DIA_Alwin_Fellan_15_01"); //¿De quién hablas?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_02"); //¿No oyes ese martilleo? ¿Quién te crees que martillea todo el día en el distrito del puerto?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_03"); //Hablo del lunático de Fellan. Se lleva el martillo a su choza todos los días.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_FellanRunning (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_FellanRunning_Condition;
	information	= DIA_Alwin_FellanRunning_Info;
	permanent	= FALSE;
	description = "Podría ocuparme de Fellan...";
};                       
FUNC INT DIA_Alwin_FellanRunning_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanRunning_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_00"); //Podría ocuparme de Fellan...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_01"); //¿Quieres ayudarme? ¿Y tú que sacas a cambio?
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_02"); //Tú me dirás.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_03"); //Oh, ¡funciona así! De acuerdo. Si puedes hacer que deje de martillear, te pagaré 25 monedas de oro.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_04"); //Pero te aviso ya de una cosa: no puedes hablar con ese tipo. Está chalado. ¡Lo único que te ayudará será un par de buenos puñetazos!
	
	MIS_AttackFellan = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Alwin,LOG_RUNNING);
	B_LogEntry (TOPIC_Alwin,"Alwin quiere que consiga que Fellan deje de dar palizas. No parece que matarlo sea la solución.");
		
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
	Info_AddChoice (DIA_Alwin_FellanRunning, "Veré lo que puedo hacer...", DIA_Alwin_FellanRunning_Ok);
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		Info_AddChoice (DIA_Alwin_FellanRunning, "Si le pego, me meteré en problemas con la milicia...", DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Ok_15_00"); //Veré lo que puedo hacer...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_Ok_12_01"); //Puedes pensarlo. Recuerda, te pagaré 25 monedas de oro.
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Problems_15_00"); //Si le pego, me meteré en problemas con la milicia...
	AI_Output (self ,other,"DIA_Alwin_Add_12_00"); //Aquí abajo, en el puerto, nadie presta mucha atención a las broncas...
	AI_Output (self ,other,"DIA_Alwin_Add_12_01"); //Pero si robas por aquí, o enredas con las ovejas, te meterás en problemas.

	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_01"); //Der irre Fellan wird nicht zur Miliz rennen und dich anzeigen. Du könntest höchstens ein Problem bekommen, wenn seine Nachbarn was davon mitbekommen.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_02"); //Schlägereien sind hier nicht gerne gesehen, und je mehr Zeugen es gibt, desto schlimmer wird die Sache.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_03"); //Aber wenn du ihn dazu bringst, dass ER dich angreift, werden alle Leute, die den Kampf mitkriegen, auf deiner Seite sein.
};

//***************************************************
//		Fellan auf's Maul gehauen 
//***************************************************
INSTANCE DIA_Alwin_FellanSuccess(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 4;
	condition	= DIA_Alwin_FellanSuccess_Condition;
	information	= DIA_Alwin_FellanSuccess_Info;
	permanent	= FALSE;
	description	= "Fellan ya no martilleará más.";
};                       
FUNC INT DIA_Alwin_FellanSuccess_Condition()
{	
	if (MIS_AttackFellan == LOG_RUNNING)
	&& ((FellanGeschlagen == TRUE)
	|| Npc_IsDead (Fellan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanSuccess_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanSuccess_15_00"); //Fellan ya no martilleará más.
	AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_01"); //¿Has oído? Se acabó el martilleo. Por fin. Pensé que el tío no pararía nunca.
	
	if (Npc_IsDead (Fellan) == FALSE) 
	{
		AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_02"); //Me has hecho un enorme favor. ¿Sabes qué?, te daré 30 monedas de oro.
		
		B_GiveInvItems (self, other, ItMi_Gold, 30);
		
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient); 
	}
	else 
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};
//***************************************************
//		Perm Info
//***************************************************
INSTANCE DIA_Alwin_Endlos(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 8;
	condition	= DIA_Alwin_Endlos_Condition;
	information	= DIA_Alwin_Endlos_Info;
	permanent	= TRUE;
	description	= "¿Y cómo están las ovejas?";
};                       
FUNC INT DIA_Alwin_Endlos_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Alwin_Sheep)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Endlos_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Endlos_15_00"); //¿Y cómo están las ovejas?
	
	if (MIS_AttackFellan != LOG_SUCCESS)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_01"); //El martilleo de Fellan las va a volver locas. Uno de estos días se van a caer a trozos.
		
	}
	else if (Kapitel <= 2)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_02"); //Las ovejas comen y no paran de engordar. Como mi mujer. JA, JA, JA (se ríe exageradamente).
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_03"); //Probablemente tendré que matar una. ¡Para la última cena!
			AI_Output (other, self,"DIA_Alwin_Endlos_15_04"); //¿Para qué?
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_05"); //Para el mercenario que asesinó al paladín. Naturalmente, será ejecutado.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_06"); //Solo tengo que decidir a qué bicho pasaré por la piedra.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_07"); //Lucy tiene suerte de estar viva.
			AI_Output (other, self,"DIA_Alwin_Endlos_15_08"); //Creí que dijiste que Lucy era tu esposa.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_09"); //Claro, pero también llamé Lucy a la oveja. Me refiero a la oveja que estaba destinada para la última cena de ese tal Bennet.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_10"); //Pero todo eso se arregló. Lucy estará contenta.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_11"); //Según pasa el tiempo, ver comer a las ovejas resulta bastante aburrido.
	}
	else	//Kapitel 5
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_12"); //Me voy a despedir de ellas. Lord Hagen ha ordenado que todas las ovejas deben servir como provisiones para su ejército.
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_13"); //Bueno, al menos tendré más tiempo para mi mujer.
	};
};



