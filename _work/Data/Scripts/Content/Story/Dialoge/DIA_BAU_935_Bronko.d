///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bronko_EXIT   (C_INFO)
{
	npc         = BAU_935_Bronko;
	nr          = 999;
	condition   = DIA_Bronko_EXIT_Condition;
	information = DIA_Bronko_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bronko_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bronko_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bronko_HALLO		(C_INFO)
{
	npc		 = 	BAU_935_Bronko;
	nr		 = 	1;
	condition	 = 	DIA_Bronko_HALLO_Condition;
	information	 = 	DIA_Bronko_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Bronko_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Bronko_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Bronko_HALLO_06_00"); //(Paternal) Entonces, ¿adónde vamos?
	AI_Output			(other, self, "DIA_Bronko_HALLO_15_01"); //¿Eres el capataz?

	if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Bronko_HALLO_06_02"); //Voy a darte un guantazo, granuja.
		};
		
	AI_Output			(self, other, "DIA_Bronko_HALLO_06_03"); //Si quieres deambular por mis tierras, tendrás que pagarme 5 monedas de oro. Si no, te vas a llevar una buena paliza.
	
	Info_ClearChoices	(DIA_Bronko_HALLO);

	Info_AddChoice	(DIA_Bronko_HALLO, "Ni hablar. No vas a sacarme nada.", DIA_Bronko_HALLO_vergisses );
	Info_AddChoice	(DIA_Bronko_HALLO, "Si no me queda más remedio, te pagaré.", DIA_Bronko_HALLO_hiergeld );
	Info_AddChoice	(DIA_Bronko_HALLO, "¿Tus tierras? ¿Eres el granjero?", DIA_Bronko_HALLO_deinland );

};

func void DIA_Bronko_HALLO_deinland ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_deinland_15_00"); //¿Tus tierras? ¿Eres el granjero?
	AI_Output			(self, other, "DIA_Bronko_HALLO_deinland_06_01"); //Por supuesto. De lo contrario, ¿por qué iba a exigirte peaje?
	AI_Output			(self, other, "DIA_Bronko_HALLO_deinland_06_02"); //Me da lo mismo si le preguntas a los demás por mí. ¡Je, je!

};

func void DIA_Bronko_HALLO_hiergeld ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_hiergeld_15_00"); //Si no me queda más remedio, te pagaré.

	if ((Npc_HasItems (other,ItMi_Gold)) >= 5)
		{
			B_GiveInvItems (other, self, ItMi_Gold, 5);						

			AI_Output			(self, other, "DIA_Bronko_HALLO_hiergeld_06_01"); //(Con picardía) Gracias. Que te vaya bien.
		
			AI_StopProcessInfos (self);	 
		}
	else
		{
		 	AI_Output			(self, other, "DIA_Bronko_HALLO_hiergeld_06_02"); //Ni siquiera tienes 5 monedas de oro. Intentas hacerme una jugarreta, ¿eh?
		 	
		 	AI_StopProcessInfos (self);	 	
		 	B_Attack (self, other, AR_NONE, 1);	
		};
};

func void DIA_Bronko_HALLO_vergisses ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_vergisses_15_00"); //Ni hablar. No vas a sacarme nada.

	if ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_01"); //Entonces, me temo que voy a tener que curtirte a palos.
		}
	else
		{
			if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_02"); //Los chicos de la guardia de la ciudad andáis cortos de dinero, ¿eh?
			};
	
			if (hero.guild == GIL_KDF)
			{
				AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_03"); //Me da igual si eres mago. Tendrás que pagar, ¿te enteras?
			};		
		};

	Info_ClearChoices	(DIA_Bronko_HALLO);

	Info_AddChoice	(DIA_Bronko_HALLO, "Si no me queda más remedio, te pagaré.", DIA_Bronko_HALLO_hiergeld );
	Info_AddChoice	(DIA_Bronko_HALLO, "Entonces, inténtalo.", DIA_Bronko_HALLO_attack );
};

func void DIA_Bronko_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_attack_15_00"); //Entonces, inténtalo.
	AI_Output			(self, other, "DIA_Bronko_HALLO_attack_06_01"); //Bueno, en ese caso...

	AI_StopProcessInfos (self);	 	
	B_Attack (self, other, AR_NONE, 1);	
};

///////////////////////////////////////////////////////////////////////
//	Info keinBauer
///////////////////////////////////////////////////////////////////////
instance DIA_Bronko_KEINBAUER		(C_INFO)
{
	npc		 = 	BAU_935_Bronko;
	nr		 = 	2;
	condition	 = 	DIA_Bronko_KEINBAUER_Condition;
	information	 = 	DIA_Bronko_KEINBAUER_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Tú el granjero? No me hagas reír.";
};

var int DIA_Bronko_KEINBAUER_noPerm;

func int DIA_Bronko_KEINBAUER_Condition ()
{
	if 	(
		((MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)	|| (Babera_BronkoKeinBauer == TRUE))
		&&  (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
		&& (DIA_Bronko_KEINBAUER_noPerm == FALSE)
		)
		{
				return TRUE;
		};
};

func void DIA_Bronko_KEINBAUER_Info ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_15_00"); //¿Tú, el granjero? No me hagas reír. La verdad es que eres un don nadie.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_06_01"); //¿Quéeee? ¿Quieres que te parta la cara?

	Info_ClearChoices	(DIA_Bronko_KEINBAUER);

	if (hero.guild == GIL_NONE)
		{
			if(Babera_BronkoKeinBauer == TRUE)
				{
					Info_AddChoice	(DIA_Bronko_KEINBAUER, "(Asustar a Bronco con traer mercenarios)", DIA_Bronko_KEINBAUER_SLD );
				};
			if (MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)
				{	
					Info_AddChoice	(DIA_Bronko_KEINBAUER, "Sekob es el granjero, y tú no eres más que un tunante de poca monta.", DIA_Bronko_KEINBAUER_sekobderbauer );
				};
		};

	Info_AddChoice	(DIA_Bronko_KEINBAUER, "A ver si tienes lo que hay que tener.", DIA_Bronko_KEINBAUER_attack );
	Info_AddChoice	(DIA_Bronko_KEINBAUER, "¿A ti que te importa?", DIA_Bronko_KEINBAUER_schongut );

};

func void DIA_Bronko_KEINBAUER_attack ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_attack_15_00"); //A ver si tienes lo que hay que tener.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_attack_06_01"); //Estaba deseando que lo dijeras.
	
	AI_StopProcessInfos (self);	 	
	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Bronko_KEINBAUER_sekobderbauer ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_00"); //Sekob es el granjero, y tú no eres más que un tunante de poca monta que intenta sacarle dinero a la gente.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_01"); //¿Quién lo dice?
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_02"); //Lo digo yo. Sekob quiere que vuelvas al trabajo y que dejes de haraganear.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_03"); //¿Y qué? ¿Ahora qué vas a hacer?
};

func void DIA_Bronko_KEINBAUER_schongut ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_schongut_15_00"); //¿A ti que te importa?
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_schongut_06_01"); //¡Lárgate!

 	AI_StopProcessInfos (self);	 	
};

func void DIA_Bronko_KEINBAUER_SLD ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_SLD_15_00"); //Muy bien, entonces tendré que decir al terrateniente Onar que hay un granjero fanfarrón que se niega a pagar la renta.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_01"); //Ejem. Espera un momento. Onar me mandará a todos los mercenarios.
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_SLD_15_02"); //¿Y qué?
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_03"); //Vale, vale. Te daré lo que quieras, pero no metas a los mercenarios, ¿eh?

	if (B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self,ItMi_Gold)))
	{
		AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_04"); //Ten, voy a darte todo mi oro.
	};
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_05"); //Y me volveré al campo. No quiero saber nada de los mercenarios.

	AI_StopProcessInfos (self);	 	
	DIA_Bronko_KEINBAUER_noPerm = TRUE;
	Npc_ExchangeRoutine	(self,"Start"); 
	MIS_Sekob_Bronko_eingeschuechtert = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info fleissig
///////////////////////////////////////////////////////////////////////
instance DIA_Bronko_FLEISSIG		(C_INFO)
{
	npc		 = 	BAU_935_Bronko;
	nr		 = 	3;
	condition	 = 	DIA_Bronko_FLEISSIG_Condition;
	information	 = 	DIA_Bronko_FLEISSIG_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Mofarte de Bronco)";
};

func int DIA_Bronko_FLEISSIG_Condition ()
{
	if 	(
		(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) 
		)
			{
					return TRUE;
			};
};

func void DIA_Bronko_FLEISSIG_Info ()
{
	
	if (MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		{
			AI_Output			(other, self, "DIA_Bronko_FLEISSIG_15_00"); //¿Qué pasa? ¿Sigues tan ocupado?
		}
	else
		{
			AI_Output			(other, self, "DIA_Bronko_FLEISSIG_15_01"); //¿Qué pasa? ¿Sigues teniendo esa bocaza?
		};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_02"); //Eres mercenario, ¿verdad? Me lo tenía que haber imaginado.
		}
	else if (MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_03"); //(Temeroso) No vas a traer a los mercenarios, ¿eh?
		};

	if 	(
			(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		|| 	(hero.guild == GIL_SLD) 
		|| 	(hero.guild == GIL_DJG)
		)
			{
				AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_04"); //No me pegues, por favor.
			};

	AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_05"); //También volveré al trabajo, ¿vale?

	MIS_Sekob_Bronko_eingeschuechtert	= LOG_SUCCESS;
	AI_StopProcessInfos (self);	 
	Npc_ExchangeRoutine	(self,"Start"); 
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bronko_PICKPOCKET (C_INFO)
{
	npc			= BAU_935_Bronko;
	nr			= 900;
	condition	= DIA_Bronko_PICKPOCKET_Condition;
	information	= DIA_Bronko_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Bronko_PICKPOCKET_Condition()
{
	C_Beklauen (54, 80);
};
 
FUNC VOID DIA_Bronko_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bronko_PICKPOCKET);
	Info_AddChoice		(DIA_Bronko_PICKPOCKET, DIALOG_BACK 		,DIA_Bronko_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bronko_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bronko_PICKPOCKET_DoIt);
};

func void DIA_Bronko_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bronko_PICKPOCKET);
};
	
func void DIA_Bronko_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bronko_PICKPOCKET);
};


















