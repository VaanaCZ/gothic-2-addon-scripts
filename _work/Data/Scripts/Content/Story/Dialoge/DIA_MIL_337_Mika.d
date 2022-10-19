///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_EXIT   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 999;
	condition   = DIA_Mika_EXIT_Condition;
	information = DIA_Mika_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mika_EXIT_Condition()
{
	if Kapitel <=2
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Refuse Talk wenn Lares am Start
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Refuse   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 1;
	condition   = DIA_Mika_Refuse_Condition;
	information = DIA_Mika_Refuse_Info;
	permanent   = TRUE;
	important 	= TRUE;
};

FUNC INT DIA_Mika_Refuse_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Lares.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mika_Refuse_Info()
{
	B_Say(self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WOHIN		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr    	 = 4;     
	condition	 = 	DIA_Mika_WOHIN_Condition;
	information	 = 	DIA_Mika_WOHIN_Info;
	important	 = 	TRUE;
};

func int DIA_Mika_WOHIN_Condition ()
{
	if (Lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mika_WOHIN_Info ()
{
	AI_Output			(self, other, "DIA_Mika_WOHIN_12_00"); //Eh, eh, no tan deprisa. Es peligroso rondar por aquí. ¿De dónde vienes?

	Info_ClearChoices	(DIA_Mika_WOHIN);

	Info_AddChoice	(DIA_Mika_WOHIN, "No es de tu incumbencia.", DIA_Mika_WOHIN_weg );
	Info_AddChoice	(DIA_Mika_WOHIN, "De una de las granjas.", DIA_Mika_WOHIN_Bauern );
	Info_AddChoice	(DIA_Mika_WOHIN, "¡De la ciudad!", DIA_Mika_WOHIN_stadt );
};
func void DIA_Mika_WOHIN_stadt ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_stadt_15_00"); //¡De la ciudad!
	AI_Output			(self, other, "DIA_Mika_WOHIN_stadt_12_01"); //Vaya, vaya. Y ¿qué haces rondando por aquí, tan lejos de la protección de las murallas de la ciudad?

	Info_ClearChoices	(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_Bauern ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_Bauern_15_00"); //De una de las granjas.
	AI_Output			(self, other, "DIA_Mika_WOHIN_Bauern_12_01"); //Eres granjero, ¿eh? En ese caso no deberías caminar solo por estos peligrosos senderos. Quién sabe lo que podría estar esperándote.

	Info_ClearChoices	(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_weg ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_weg_15_00"); //No es de tu incumbencia.
	AI_Output			(self, other, "DIA_Mika_WOHIN_weg_12_01"); //Lo que tú digas. Pero luego no te quejes si alguien te despelleja. Que te vaya bien.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasGefaehrlich
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASGEFAEHRLICH		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	5;
	condition	 = 	DIA_Mika_WASGEFAEHRLICH_Condition;
	information	 = 	DIA_Mika_WASGEFAEHRLICH_Info;

	description	 = 	"¿Qué es tan peligroso?";
};

func int DIA_Mika_WASGEFAEHRLICH_Condition ()
{
	return TRUE;
};

func void DIA_Mika_WASGEFAEHRLICH_Info ()
{
	AI_Output			(other, self, "DIA_Mika_WASGEFAEHRLICH_15_00"); //¿Qué es tan peligroso?
	AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_01"); //Muchas cosas.
	if (other.protection[PROT_EDGE]	< ITAR_Leather_L.protection [PROT_EDGE])	//Joly: kleiner als die Lederrüstung
	{
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_02"); //Por un lado están los bandidos. A un mequetrefe como tú se lo pulirían para desayunar.
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_03"); //Si los bandidos no te atrapan, los animales salvajes del bosque o los mercenarios de los alrededores se ocuparán de ti.
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_04"); //Por eso, antes de salir hazte con una armadura decente.
	};
	AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_05"); //Apuesto a que me pedirás ayuda a gritos en cuanto dobles la primera curva del camino.
	
};

///////////////////////////////////////////////////////////////////////
//	Info waskostetHilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASKOSTETHILFE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	6;
	condition	 = 	DIA_Mika_WASKOSTETHILFE_Condition;
	information	 = 	DIA_Mika_WASKOSTETHILFE_Info;

	description	 = 	"Supongamos que recurriera a tu ayuda.";
};

func int DIA_Mika_WASKOSTETHILFE_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Mika_WASGEFAEHRLICH))
				{
						return TRUE;
				};
};

func void DIA_Mika_WASKOSTETHILFE_Info ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_15_00"); //Supongamos que recurriera a tu ayuda. ¿Cuánto me costaría?
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_01"); //No soy más que un siervo humilde del rey y no me gustaría desplumar a un habitante desvalido del reino.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_02"); //Pero si lo planteas así, no me opondría a cierto respaldo monetario para fomentar nuestra futura relación comercial.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_03"); //Para empezar bastaría con 10 monedas de oro. ¿Qué te parece?

	Info_ClearChoices	(DIA_Mika_WASKOSTETHILFE);

	Info_AddChoice	(DIA_Mika_WASKOSTETHILFE, "Me lo pensaré.", DIA_Mika_WASKOSTETHILFE_nochnicht );
	Info_AddChoice	(DIA_Mika_WASKOSTETHILFE, "¿Por qué no? Aquí tienes las 10 monedas.", DIA_Mika_WASKOSTETHILFE_ja );

};

func void DIA_Mika_WASKOSTETHILFE_ja ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_ja_15_00"); //¿Por qué no? Aquí tienes las 10 monedas.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
			{
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_01"); //Genial. Si necesitas mi ayuda, ya sabes dónde encontrarme.
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_02"); //Pero hazme el favor de no venirme con menudencias. No lo soporto, ¿me oyes?
				
				Mika_Helps = TRUE;
			}
		else
			{
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_03"); //No tienes dinero. Quizá debas pensarte bien si quieres que te ayude.
			};
	AI_StopProcessInfos (self);
};

func void DIA_Mika_WASKOSTETHILFE_nochnicht ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_nochnicht_15_00"); //Me lo pensaré.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_nochnicht_12_01"); //Haz lo que quieras. Que te vaya bien la muerte.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Ueberlegt
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_UEBERLEGT		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	7;
	condition	 = 	DIA_Mika_UEBERLEGT_Condition;
	information	 = 	DIA_Mika_UEBERLEGT_Info;
	permanent	 = 	TRUE;

	description	 = 	"He cambiado de idea. Te pagaré las 10 monedas de oro.";
};

func int DIA_Mika_UEBERLEGT_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Mika_WASKOSTETHILFE))
	&&	(Mika_Helps == FALSE))
	{
		return TRUE;
	};
};
func void DIA_Mika_UEBERLEGT_Info ()
{
	AI_Output			(other, self, "DIA_Mika_UEBERLEGT_15_00"); //He cambiado de idea. Te pagaré las 10 monedas de oro.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
		{
			AI_Output			(self, other, "DIA_Mika_UEBERLEGT_12_01"); //Estupendo. Mejor tarde que nunca. ¿Y ahora qué?
			
			Mika_Helps = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Mika_UEBERLEGT_12_02"); //(Enojado) Vuelve cuando tengas el dinero.
			AI_StopProcessInfos (self);	
		};
};

///////////////////////////////////////////////////////////////////////
//	Info HILFE
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_HILFE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	8;
	condition	 = 	DIA_Mika_HILFE_Condition;
	information	 = 	DIA_Mika_HILFE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Necesito tu ayuda.";
};

func int DIA_Mika_HILFE_Condition ()
{
	if (Mika_Helps == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Mika_HILFE_Info ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_15_00"); //Necesito tu ayuda.
	AI_Output			(self, other, "DIA_Mika_HILFE_12_01"); //Si es absolutamente necesario... ¿Qué pasa?

	Info_ClearChoices	(DIA_Mika_HILFE);
	
	Info_AddChoice	(DIA_Mika_HILFE, "Me persiguen unos bandidos.", DIA_Mika_HILFE_schongut );
	Info_AddChoice	(DIA_Mika_HILFE, "Me han atacado unos monstruos.", DIA_Mika_HILFE_monster );

	if (!Npc_IsDead (Alvares)) 
	&& (!Npc_IsDead (Engardo))
	&& ( (Akils_SLDstillthere == TRUE) || (Npc_KnowsInfo (other, DIA_Sarah_Bauern)) )
	{
		Info_AddChoice	(DIA_Mika_HILFE, "Unos mercenarios han atacado al granjero Akil.", DIA_Mika_HILFE_Akil );
	};
};

func void DIA_Mika_HILFE_Akil ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_Akil_15_00"); //Unos mercenarios han atacado al granjero Akil.
	AI_Output			(self, other, "DIA_Mika_HILFE_Akil_12_01"); //(Intranquilo) ¿Qué? ¿Esa chusma ronda la granja de Akil? No perdamos el tiempo. Sígueme.

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_GivePlayerXP (Xp_Ambient);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Mika quiere ayudarme a solucionar el problema de los mercenarios en la granja de Akil."); 

	Npc_ExchangeRoutine	(self,"Akil"); 
};

func void DIA_Mika_HILFE_monster ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_monster_15_00"); //Me han atacado unos monstruos.
	AI_Output			(self, other, "DIA_Mika_HILFE_monster_12_01"); //No veo ningún monstruo. Seguro que te lo has inventado.

	AI_StopProcessInfos (self);	
};

func void DIA_Mika_HILFE_schongut ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_schongut_15_00"); //Me persiguen unos bandidos.
	AI_Output			(self, other, "DIA_Mika_HILFE_schongut_12_01"); //¿En serio? ¿Y dónde están? Si te estuvieran persiguiendo, al menos vería a uno de ellos, ¿no?

	AI_StopProcessInfos (self);	
};



///////////////////////////////////////////////////////////////////////
//	Info Zack
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Zack		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	8;
	condition	 = 	DIA_Mika_Zack_Condition;
	information	 = 	DIA_Mika_Zack_Info;
	important	 = 	TRUE;

};

func int DIA_Mika_Zack_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_FARM2_PATH_03")<500)
	&& ((!Npc_IsDead (Alvares))||(!Npc_IsDead (Engardo)))	
		{
			return TRUE;
		};
};

func void DIA_Mika_Zack_Info ()
{
	AI_Output			(self, other, "DIA_Mika_Zack_12_00"); //Mira cómo se hace.
	Info_AddChoice	(DIA_Mika_Zack, DIALOG_ENDE, DIA_Mika_Zack_los );
};
func void DIA_Mika_Zack_los ()
{
	AI_StopProcessInfos (self);
	//Joly: B_attack funzt hier nicht und ist auch nicht nötig!!!!!!!!!!!
	if(!Npc_IsDead (Alvares))
	{
		Alvares.aivar[AIV_EnemyOverride] = FALSE;
	};	
	if (!Npc_IsDead (Engardo))
	{
		Engardo.aivar[AIV_EnemyOverride] = FALSE;
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info WiederNachHause
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WIEDERNACHHAUSE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr 		 = 9;
	condition	 = 	DIA_Mika_WIEDERNACHHAUSE_Condition;
	information	 = 	DIA_Mika_WIEDERNACHHAUSE_Info;
	important	 = 	TRUE;
};

func int DIA_Mika_WIEDERNACHHAUSE_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_FARM2_PATH_03")<10000)
	&& 	(Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))	
	{
		return TRUE;
	};
};

func void DIA_Mika_WIEDERNACHHAUSE_Info ()
{
	AI_Output			(self, other, "DIA_Mika_WIEDERNACHHAUSE_12_00"); //Muy bien. Ya está. Me marcho.

	AI_StopProcessInfos (self);		
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Start"); 
	B_GivePlayerXP (Xp_Ambient);
};

//############################################
//##
//##	Kapitel 3
//##
//############################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Kap3_EXIT   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 999;
	condition   = DIA_Mika_Kap3_EXIT_Condition;
	information = DIA_Mika_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mika_Kap3_EXIT_Condition()
{
	if Kapitel >= 3
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//***************************************************
//		Perm Kap3
//***************************************************

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Kap3u4u5_PERM   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 39;
	condition   = DIA_Mika_Kap3u4u5_PERM_Condition;
	information = DIA_Mika_Kap3u4u5_PERM_Info;
	permanent   = TRUE;
	description = "¿Todo tranquilo?";
};

FUNC INT DIA_Mika_Kap3u4u5_PERM_Condition()
{
	if  (Kapitel >= 3)
	&& 	(Npc_KnowsInfo(other, DIA_Mika_WOHIN))
	&& 	(Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))	
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_Kap3u4u5_PERM_Info()
{
	AI_Output (other,self ,"DIA_Mika_Kap3u4u5_PERM_15_00"); //¿Todo tranquilo?
	AI_Output (self ,other,"DIA_Mika_Kap3u4u5_PERM_12_01"); //Sigues vivo. Estoy impresionado.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mika_PICKPOCKET (C_INFO)
{
	npc			= Mil_337_Mika;
	nr			= 900;
	condition	= DIA_Mika_PICKPOCKET_Condition;
	information	= DIA_Mika_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Mika_PICKPOCKET_Condition()
{
	C_Beklauen (65, 75);
};
 
FUNC VOID DIA_Mika_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mika_PICKPOCKET);
	Info_AddChoice		(DIA_Mika_PICKPOCKET, DIALOG_BACK 		,DIA_Mika_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mika_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mika_PICKPOCKET_DoIt);
};

func void DIA_Mika_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mika_PICKPOCKET);
};
	
func void DIA_Mika_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mika_PICKPOCKET);
};


