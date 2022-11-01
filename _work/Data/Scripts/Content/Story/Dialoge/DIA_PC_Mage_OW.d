


// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_MiltenOW_EXIT(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 999;
	condition	= DIA_MiltenOW_EXIT_Condition;
	information	= DIA_MiltenOW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_MiltenOW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  		Hallo
// ************************************************************

INSTANCE DIA_MiltenOW_Hello (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= TRUE;
	condition	= DIA_MiltenOW_Hello_Condition;
	information	= DIA_MiltenOW_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_MiltenOW_Hello_Condition()
{
		return TRUE;
};
FUNC VOID DIA_MiltenOW_Hello_Info()
{	
	AI_Output	(self ,other,"DIA_MiltenOW_Hello_03_00");//¡Mira quién ha vuelto! ¡Nuestro héroe de la barrera!
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Me alegro de verte, Milten.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice (DIA_MiltenOW_Hello,"¿Te conozco?",DIA_MiltenOW_Hello_NO);
};
	// ------------------------------------
	func void B_Milten_GornDiegoLester()
	{
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_02"); //¿Recuerdas a Gorn, Diego y Lester?
	};
	// ------------------------------------

FUNC VOID DIA_MiltenOW_Hello_YES()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_YES_15_00");//Me alegro de verte, Milten. ¿Vuelves de algún sitio o te has quedado por aquí?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_01");//He vuelto. Después de que la barrera se colapsara, entré en el monasterio de los magos de fuego.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_02");//Pero cuando quedó claro que los paladines querían venir aquí, mi experiencia y conocimiento del lugar demostraron ser eficaces.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_03");//Así que entonces decidieron confiarme la sagrada misión de proporcionar apoyo mágico a la expedición.
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Claro que recuerdo a los chicos.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Esos nombres no me suenan de nada.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_NO()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_NO_15_00");//¿Se supone que los conozco?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_01");//Has pasado por mucho, ¿verdad?
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Bien, ¿y cuál es el informe?",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Esos nombres no me suenan de nada.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_Friends()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_00");//Claro que recuerdo a los chicos.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_01");//Bueno, Gorn y Diego no llegaron lejos. Los encontraron los paladines aquí en el valle.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_02");//Sin embargo, Lester ha desaparecido. No tengo ni idea de por dónde andará.
	
	if (Npc_KnowsInfo (other, DIA_Lester_Hello)) 
	{
		AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_03");//He encontrado a Lester. Ahora está con Xardas.
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_04");//Por fin una buena noticia.
	};
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_05");//Bueno, no tengo nada agradable que decirte.
	
	Knows_Diego = TRUE;
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
FUNC VOID DIA_MiltenOW_Hello_Forget()
{
	AI_Output (other,self ,"DIA_MiltenOW_Hello_Forget_15_00");//Esos nombres no me suenan de nada.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_01");//Te has olvidado de muchas cosas, ¿verdad? Bueno, dejemos atrás el pasado y dediquémonos al presente.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_02");//Aunque no se pueda contar nada agradable.
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
// ************************************************************
// 		Bericht	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Bericht(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 3;
	condition	= DIA_MiltenOW_Bericht_Condition;
	information	= DIA_MiltenOW_Bericht_Info;
	permanent	= FALSE;
	description = "Bien, ¿y cuál es el informe?";
};                       

FUNC INT DIA_MiltenOW_Bericht_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Bericht_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Bericht_15_00");//Bien, ¿y qué se puede contar?
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_01");//Los paladines han venido aquí con la intención de extraer mineral mágico.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_02");//Pero con los ataques de los orcos y los dragones, no se me ocurre cómo podrán salir de aquí con el mineral.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_03");//No, por Innos, siento la presencia de algo oscuro... algo maligno, que medra aquí. Algo que emana de este valle.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_04");//Pagamos caro la aniquilación del Durmiente. La destrucción de la barrera también ha arruinado este lugar.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_05");//Si sobrevivimos a esto, podremos considerarnos afortunados.
};
// ************************************************************
// 		Erz		  
// ************************************************************
INSTANCE DIA_MiltenOW_Erz(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 4;
	condition	= DIA_MiltenOW_Erz_Condition;
	information	= DIA_MiltenOW_Erz_Info;
	permanent	= FALSE;
	description = "¿Cuánto mineral has almacenado hasta ahora?";
};                       

FUNC INT DIA_MiltenOW_Erz_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Bericht)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Erz_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Erz_15_00");//¿Cuánto mineral has almacenado hasta ahora?
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_01");//¿Cuánto mineral...? ¡Ni un cofre! Llevamos tiempo sin tener contacto con los raspadores.
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_02");//No me sorprendería que llevaran mucho tiempo muertos. ¡Y además nos atacan dragones y nos asedian los orcos!
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_03");//Esta expedición es un completo desastre.
	
};
/*	
	Diesen Blick kenne ich, den hattest Du auch kurz bevor Du in den Schläfertempel gegangen bist.
*/
// ************************************************************
// 		Wo sind Gorn und Diego?	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Wo(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Wo_Condition;
	information	= DIA_MiltenOW_Wo_Info;
	permanent	= FALSE;
	description = "¿Dónde están ahora Gorn y Diego?";
};                       

FUNC INT DIA_MiltenOW_Wo_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	&& (Knows_Diego == TRUE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Wo_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Wo_Forget_15_00");//¿Dónde están ahora Gorn y Diego?
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_01");//Bueno, Gorn está sentado en el calabozo, porque se resistió a la detención.
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_02");//Asignaron a Diego a una pelotón de raspadores. Pregúntale a Parcival, el paladín. Él fue el que organizó los grupos.
	
	KnowsAboutGorn = TRUE; 
	SearchForDiego = LOG_RUNNING; 
};
// ************************************************************
// 		Gorn befreien			  
// ************************************************************
INSTANCE DIA_MiltenOW_Gorn(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Gorn_Condition;
	information	= DIA_MiltenOW_Gorn_Info;
	permanent	= FALSE;
	description = "¡Vayamos a liberar a Gorn!";
};                       

FUNC INT DIA_MiltenOW_Gorn_Condition()
{	
	if (KnowsAboutGorn == TRUE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Gorn_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_00");//¡Vayamos a liberar a Gorn!
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_01");//Bueno, el problema es que Gorn es un recluso.
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_02");//Pero, con suerte, podríamos llegar a un acuerdo con Garond y comprar su libertad.
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_03");//Sí, podría ser...
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_04");//Mantenme informado.
	
	Log_CreateTopic (TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_RescueGorn,LOG_RUNNING);
	B_LogEntry (TOPIC_RescueGorn,"El comandante Garond ha encerrado a Gorn. Quizá logremos llegar a un acuerdo y le podamos sacar de la cárcel.");
};
// ************************************************************
// 		Garond will tausend Goldstücke			  
// ************************************************************
INSTANCE DIA_MiltenOW_Preis(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Preis_Condition;
	information	= DIA_MiltenOW_Preis_Info;
	permanent	= FALSE;
	description = "Garond quiere 1000 piezas de oro por Gorn.";
};                       

FUNC INT DIA_MiltenOW_Preis_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Preis_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Preis_15_00");//Garond quiere 1000 monedas de oro por Gorn.
	AI_Output (self ,other,"DIA_MiltenOW_Preis_03_01");//Una bonita cantidad. Puedo reunir 250 monedas.
	
	B_GiveInvItems (self, other, Itmi_gold, 250);
	B_LogEntry (TOPIC_RescueGorn,"Milten me ha dado 250 piezas de oro para pagar la liberación de Gorn.");

};
// ************************************************************
// 		Nicht genug Gold  
// ************************************************************
INSTANCE DIA_MiltenOW_Mehr(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Mehr_Condition;
	information	= DIA_MiltenOW_Mehr_Info;
	permanent	= FALSE;
	description = "Harán falta más para comprar la libertad de Gorn.";
};                       

FUNC INT DIA_MiltenOW_Mehr_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Npc_HasItems (other, ItMi_Gold) < 1000) 
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Preis) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Mehr_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Mehr_15_00");//Harán falta más para comprar la libertad de Gorn.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_01");//Conseguir más oro... mmm. Diego sabe mucho de ello, pero no está aquí.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_02");//Puede que Gorn tenga algo de oro escondido. Deberíamos averiguarlo.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_03");//Le escribiré una nota. Toma, intenta colarla en el calabozo.
	
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);	 
	B_LogEntry (TOPIC_RescueGorn,"Milten me ha dado un mensaje para Gorn. Si logro colarlo en la cárcel, podrá decirnos si tiene algo de oro escondido en alguna parte.");
};
// ************************************************************
// 		Ausrüstung				  
// ************************************************************
INSTANCE DIA_MiltenOW_Equipment(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Equipment_Condition;
	information	= DIA_MiltenOW_Equipment_Info;
	permanent	= FALSE;
	description = "¿Me puedes dar algo de equipo?";
};                       

FUNC INT DIA_MiltenOW_Equipment_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Garond_Equipment)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Equipment_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Equipmentt_15_00");//¿Me puedes dar algo de equipo? Garond me ha pedido que vaya a las minas.
	AI_Output (self ,other,"DIA_MiltenOW_Equipment_03_01");//¿Dónde se supone que voy a conseguirlo? Lo único que puedo darte es una valiosa piedra rúnica.
	//AI_Output (self ,other,"DIA_MiltenOW_Equipmentt_03_02");//Hier stehen zwar noch ein paar Truhen rum, aber ich kann die Schlösser nicht öffnen.  
	
	B_GiveInvItems (self,other, ItMI_RuneBlank,1);
	//Schlüssel auf FP inserten
};	

//***********************
//	Gorns Versteck
//***********************

INSTANCE DIA_MiltenOW_Versteck (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 1;
	condition	= DIA_MiltenOW_Versteck_Condition;
	information	= DIA_MiltenOW_Versteck_Info;
	permanent	= FALSE;
	IMPORTANT 	= FALSE;
	description = "Gorn me ha respondido..."; 
}; 

FUNC INT DIA_MiltenOW_Versteck_Condition()
{
	if (GornsTreasure == TRUE)
	&& (Npc_HasItems (other, ItMi_GornsTreasure_MIS ) <= 0)
	&& (Gorns_Beutel == FALSE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_MiltenOW_Versteck_Info()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_00"); //Gorn me ha respondido. Dice que el oro está en la puerta sur.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_01"); //(Con acidez) Te referirás a la antigua puerta sur. El dragón la ha reducido a escombros.
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_02"); //¿Cómo puedo llegar hasta allí?
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_03"); //Está cerca del ariete de los orcos. La puerta sur estaba justo a la derecha.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_04"); //No será fácil, así que no llames la atención y date prisa.
	
	B_LogEntry (TOPIC_RescueGorn,"La antigua puerta sur está a la derecha del ariete orco. El oro de Gorn debería estar por allí.");
};
// ************************************************************
// 		Gorn ist frei		  
// ************************************************************
INSTANCE DIA_MiltenOW_Frei(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Frei_Condition;
	information	= DIA_MiltenOW_Frei_Info;
	permanent	= FALSE;
	description = "He liberado a Gorn.";
};                       

FUNC INT DIA_MiltenOW_Frei_Condition()
{	
	if (MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Frei_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Frei_15_00");//He liberado a Gorn.
	AI_Output (self ,other,"DIA_MiltenOW_Frei_03_01");//Estupendo. Entonces tendremos que pensar en lo que va a pasar a continuación.
};
// ************************************************************
// 		Lehren
// ************************************************************
INSTANCE DIA_MiltenOW_Lehren(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 9;
	condition	= DIA_MiltenOW_Lehren_Condition;
	information	= DIA_MiltenOW_Lehren_Info;
	permanent	= FALSE;
	description = "¿Puedes enseñarme algo?";
};                       

FUNC INT DIA_MiltenOW_Lehren_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Lehren_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Lehren_15_00");//¿Puedes enseñarme algo?
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_01");//Te puedo enseñar algo de magia del segundo círculo de magia o, si no, puedo ayudarte a aumentar tu poder mágico.
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_02");//Si te sientes preparado para aumentar tu poder, te puedo entrenar.
};	

// ************************************************************
// 		Teach zweiter Kreis
// ************************************************************
INSTANCE DIA_MiltenOW_TeachCircle2(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 91;
	condition	= DIA_MiltenOW_TeachCircle2_Condition;
	information	= DIA_MiltenOW_TeachCircle2_Info;
	permanent	= TRUE;
	description = "¡Enséñame el segundo círculo de magia!";
};                       

FUNC INT DIA_MiltenOW_TeachCircle2_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_MiltenOW_Lehren))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_TeachCircle2_Info()
{	
	AI_Output (other, self, "DIA_Milten_Add_15_00"); //¡Enséñame el segundo círculo de magia!
	AI_Output (self, other, "DIA_Milten_Add_03_01"); //Ése suele ser un privilegio de los maestros de nuestra orden.
	AI_Output (self, other, "DIA_Milten_Add_03_02"); //Pero creo que, en este caso, puedo hacer una excepción...
	
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_Milten_Add_03_03"); //No sé si recuerdo las palabras protocolarias...
		AI_Output (self, other, "DIA_Milten_Add_03_04"); //Entra ahora en el segundo círculo. Esto... te mostrará el camino, pero tus obras crean el camino, o algo por el estilo...
		AI_Output (self, other, "DIA_Milten_Add_03_05"); //Creo que entiendes de qué va...
	};
};


// ************************************************************
// 		Teach
// ************************************************************
INSTANCE DIA_MiltenOW_Teach(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 90;
	condition	= DIA_MiltenOW_Teach_Condition;
	information	= DIA_MiltenOW_Teach_Info;
	permanent	= TRUE;
	description = "Quiero aprender más conjuros.";
};                       

FUNC INT DIA_MiltenOW_Teach_Condition()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Teach_15_00");//Quiero aprender nuevos conjuros.
	
	if  (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices (DIA_MiltenOW_Teach);
		Info_AddChoice (DIA_MiltenOW_Teach,DIALOG_BACK,DIA_MiltenOW_Teach_BACK);
		
		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_MiltenOW_Teach_Windfist);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_MiltenOW_Teach_Feuerball);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_MiltenOW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenOW_Teach_03_01");//Todavía no has llegado al segundo círculo de magia. No te puedo enseñar nada.
	};
};	
FUNC VOID DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_Teach);
};
FUNC VOID DIA_MiltenOW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_MiltenOW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenOW_Mana		(C_INFO)
{
	npc		  	 = 	PC_Mage_OW;
	nr			 = 	100;
	condition	 = 	DIA_MiltenOW_Mana_Condition;
	information	 = 	DIA_MiltenOW_Mana_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quiero aumentar mis poderes mágicos.";
};
func int DIA_MiltenOW_Mana_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_MiltenOW_Mana_Info ()
{
	AI_Output (other, self, "DIA_MiltenOW_Mana_15_00"); //Quiero aumentar mis poderes mágicos.
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenOW_Mana_03_00"); //Tu poder mágico es grande, demasiado como para que pueda ayudarte a aumentarlo.
	};
	Info_ClearChoices (DIA_MiltenOW_Mana);
};
func void DIA_MiltenOW_Mana_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
	
};
func void DIA_MiltenOW_Mana_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
// ************************************************************
// 		Perm
// ************************************************************
INSTANCE DIA_MiltenOW_Perm(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Perm_Condition;
	information	= DIA_MiltenOW_Perm_Info;
	permanent	= TRUE;
	description = "¿A qué te dedicas?";
};                       
FUNC INT DIA_MiltenOW_Perm_Condition()
{	
	if (Kapitel == 2)
	&& (Npc_KnowsInfo (other, DIA_MiltenOW_Frei) == FALSE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Perm_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Perm_15_00");//¿Qué cometido tienes aquí?
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_01");//Al principio debía analizar el mineral mágico. Pero hasta ahora no hemos visto mucho.
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_02");//Ahora me estoy concentrando en el estudio de la alquimia.
};
// ************************************************************
// 		Perm 2
// ************************************************************
INSTANCE DIA_MiltenOW_Plan(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Plan_Condition;
	information	= DIA_MiltenOW_Plan_Info;
	permanent	= TRUE;
	description = "¿Cuáles son tus planes?";
};                       
FUNC INT DIA_MiltenOW_Plan_Condition()
{	
	if (Kapitel == 2)
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Frei) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Plan_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_00");//¿Cuáles son tus planes?
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_01");//Volveré. Esperaré durante un rato, pero ahora que Gorn está libre, puedo partir con él.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_02");//Es imprescindible que Pyrokar conozca la situación que vivimos aquí.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_03");//Si eso es lo que piensas.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_04");//Espero que lord Hagen reconozca la amenaza que emana de este valle. Y eso sin pensar en lo que pasaría si los orcos cruzan el paso.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_05");//Bueno, que tengas un buen viaje.
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_MiltenOW_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 888;
	condition	= DIA_MiltenOW_PICKPOCKET_Condition;
	information	= DIA_MiltenOW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sería difícil robar su poción)";
};                       

FUNC INT DIA_MiltenOW_PICKPOCKET_Condition()
{
	if (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - TheftDiff))
	{
		return 1;
	};
};
FUNC VOID DIA_MiltenOW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_MiltenOW_PICKPOCKET);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_BACK 		,DIA_MiltenOW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_MiltenOW_PICKPOCKET_DoIt);
};

func void DIA_MiltenOW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems (self,ItPo_Perm_Mana,1);
		B_GiveInvItems (self, other, ItPo_Perm_Mana, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_MiltenOW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
};



