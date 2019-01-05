/**
 * Authentication middleware
 */

 import { ILogger } from './interfaces';
 import * as crypto from 'crypto';

export function generateAuthMiddleware(apiKeyHash: string, log: ILogger) {
  return (req, res, next) => {
    const apiKey = req.get('authorization');

    // Check if API key was provided
    if (!apiKey) {
      return res.status(401).json({ error: 'MISSING_APIKEY', message: 'No API key provided via the HTTP \'authorization\' header' });
    }

    // Check if API key is correct
    const hash: string = crypto.createHash('sha256').update(apiKey).digest('hex');

    if (hash !== apiKeyHash) {
      return res.status(401).json({ error: 'WRONG_APIKEY', message: 'The provided API key is incorrect'});
    }

    // Authenticated successfully
    return next();
  };
}