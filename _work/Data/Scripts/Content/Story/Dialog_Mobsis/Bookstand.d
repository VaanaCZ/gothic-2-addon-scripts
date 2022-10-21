//##########################################################################
//##
//##	Hier stehen alle Buchst�ndermobsiscripte
//##
//##########################################################################


//*************************************
//	Buchst�nder in der Klosterbibliothek
//*************************************

FUNC VOID Use_Bookstand_01_S1()		//Buchst�nder in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	if  (hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE; //f�r die Pr�fung des Feuers 
			
			Log_CreateTopic (TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus	(TOPIC_FireContest,LOG_RUNNING);
			B_LogEntry (TOPIC_FireContest,"En tant que novice, j'ai le droit de r�clamer l'Epreuve du feu. Les trois magiciens du Haut Conseil me feront chacun passer un test. Si je les r�ussis tous les trois, je serai accept� dans le Cercle de feu.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "L'Epreuve du feu"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Bien qu'un novice puisse se croire pr�t � affronter l'Epreuve de magie, ce n'est pas pour autant qu'il sera choisi. Cependant, s'il a bien r�fl�chi et s'il insiste, il a le droit de demander l'Epreuve et aucun magicien ne peut la lui refuser. Non seulement il devra r�ussir l'Epreuve de magie, mais il devra de plus trouver l'illumination par le feu. S'il insiste aupr�s du Haut Conseil, il sera soumis � l'EPREUVE DU FEU.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "L�Epreuve doit �tre un d�fi de sagesse, de force et de dext�rit� pour le novice. Avant de prononcer le Serment du feu, il doit donc venir � bout de trois tests, chacun pr�sent� par un magicien du Haut Conseil."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Telle est la volont� d'Innos et ainsi en sera-t-il."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Le Haut Conseil"					);
					Doc_Show		( nDocID );

			
	};
};

//*************************************
//	Buchst�nder in der Geheimen Bibliothek
//*************************************
//--------------------------------------
var int FinalDragonEquipment_Once;
//--------------------------------------

FUNC VOID Use_FINALDRAGONEQUIPMENT_S1()		//Buchst�nder in der geheimen Bibliothek 
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	
		var int nDocID;
		
		nDocID = 		Doc_Create		()			  ;							
						Doc_SetPages	( nDocID,  2 );                         
						Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0); 
						Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0);
					
						Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
						Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  	
	
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLines	( nDocID,  0, "... j'esp�re que le d�me pourra prot�ger le minerai de la menace de B�liar. Le roi est assez na�f pour croire que nous l'avons construit pour pr�venir toute �vasion. Enfin, tant que de telles ruses nous permettent d'atteindre nos objectifs... J'esp�re seulement qu'il nous reste assez de temps pour nous pr�parer au combat. D�s que le D�me de la Vall�e des mines sera termin�, j'userai de tout mon pouvoir pour intervenir au cours du combat.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"Ingr�dient pour la rune 'Projectile saint' : 1 eau b�nite, pas de parchemin.");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "� j'ai suivi les instructions et j'ai vers� l'eau b�nite d'Innos sur une pierre runique vierge sur une table runique. La pierre a �t� d�truite. Je crois que ce sort n'est accessible qu'� l'Elu."); 
						Doc_PrintLines	( nDocID,  1, "J'ai laiss� l'Aura sacr�e d'Innos sous la protection du monast�re. L'abb� en prendra soin jusqu'� ce que l'Elu se r�v�le."	);
						Doc_PrintLines	( nDocID,  1, "Les Larmes d'Innos peuvent jouer un r�le pour le combat qui nous attend. Il est dangereux de les laisser � la vue de tous. Je vais les cacher dans la biblioth�que."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"Pour cr�er une rune, j'ai besoin de certains ingr�dients pour chaque rune. Avec ces ingr�dients et une pierre runique vierge, je peux cr�er la rune souhait�e sur une table runique.");
			B_LogEntry (TOPIC_TalentRunes,"Ingr�dients de la rune 'Secret de la t�l�portation' : 1 fiole d'eau b�nite.");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Vous devez cr�er une rune de t�l�portation pour atteindre la pi�ce. Il vous faut une pierre runique vierge et une fiole d'eau b�nite. Vous pourrez utiliser la rune pour vous t�l�porter"); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Je suis certain que les Larmes d'Innos sont celles que les paladins utilisaient pour le rituel de Cons�cration de l'�p�e. Cela signifie que je devrais �tre capable d'utiliser la fiole que j'ai trouv�e pour augmenter la puissance d'une arme consacr�e."	);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_Show		( nDocID );
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] 	= TRUE;	
			PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] 	= TRUE;	
			
			PrintScreen			(PRINT_LearnSmith, -1, -1, FONT_Screen, 2);
			Npc_SetTalentSkill 	(self, NPC_TALENT_SMITH, 1);
			Log_CreateTopic (TOPIC_TalentSmith,LOG_NOTE);
			B_LogEntry (TOPIC_TalentSmith,"Pour forger une arme, il me faut tout d'abord de l'acier brut que je dois chauffer � blanc dans une forge. Je dois ensuite le forger sur une enclume. Les armes sp�ciales requi�rent souvent certaines substances qui leur conf�rent des caract�ristiques sp�ciales.");
			B_LogEntry (TOPIC_TalentSmith,"Si j'ajoute 4 unit�s de minerai et 5 de sang de dragon, je peux forger une TUEUSE DE DRAGON EN FER.");
			B_LogEntry (TOPIC_TalentSmith,"Si j'ajoute 5 unit�s de minerai et 5 de sang de dragon, je peux forger une GRANDE TUEUSE DE DRAGON EN FER.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Extrait : Armes du seigneur dragon."); 
						Doc_PrintLines	( nDocID,  1, "Pour une armure en �cailles de dragon tr�s r�sistante, les �cailles doivent �tre recouvertes de minerai de l'�le de Karynis."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Pour une arme digne d'un seigneur, la lame doit �tre tremp�e dans du sang de dragon. 5 fioles de sang conf�rent � l'acier un tranchant et une puissance in�galables."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Note : 'Karynis' fait r�f�rence � ce qui est maintenant Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

